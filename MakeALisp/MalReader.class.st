"
I convert MAL source code to an AST instance of MalType.

I return an OrderedCollection of forms read.

To get started, use #readString:

MalReader readString: '(+ 1 2)'.

"
Class {
	#name : #MalReader,
	#superclass : #Object,
	#instVars : [
		'tokens',
		'index'
	],
	#category : #MakeALisp
}

{ #category : #parsing }
MalReader class >> isClose: aString [
	^ (#(')' ']' '}') includes: aString)

]

{ #category : #parsing }
MalReader class >> isClose: aString expected: close [
	(self isClose: aString)
		ifFalse: [ ^ false ].
	aString = close
		ifFalse: [ MalSyntaxError signal: 'wrong closing paren character' ].
	^ true
]

{ #category : #parsing }
MalReader class >> readAll: aString [
	"Read all the expressions in the string provided."

	| tokens stream result |
	tokens := MalTokenizer fromString: aString.
	stream := tokens readStream.
	result := OrderedCollection new.
	[stream atEnd] whileFalse: [ result add: (self readForm: stream) ].
	^ result
]

{ #category : #parsing }
MalReader class >> readAtom: aStream [
	"Parse a single mal type."

	| token firstChar |
	token := aStream next.
	token ifNil: [ MalSyntaxError signal: 'Missing ) ] or }' ].
	firstChar := token first: 1.
	(self isClose: token)
		ifTrue: [ MalSyntaxError signal: 'Unexpected ) ] or }' ].
	MalLiteral
		allSubclassesDo: [ :atom | 
			(atom matches: token)
				ifTrue: [ ^ atom fromToken: token ] ].
	^ MalSymbol withValue: token
]

{ #category : #parsing }
MalReader class >> readForm: aTokenStream [
	| current readerMacros |
	current := aTokenStream peek.
	current = '('
		ifTrue: [ aTokenStream next.
			^ self readList: aTokenStream withClose: ')' ].
	current = '['
		ifTrue: [ aTokenStream next.
			^ self readList: aTokenStream withClose: ']' ].
	current = '{'
		ifTrue: [ aTokenStream next.
			^ self readList: aTokenStream withClose: '}' ].
	readerMacros := Dictionary
		with: '@' -> 'deref'
		with: '''' -> 'quote'
		with: '`' -> 'quasiquote'
		with: '~' -> 'unquote'
		with: '~@' -> 'splice-unquote'
		with: '^' -> 'with-meta'.
	readerMacros
		at: current
		ifPresent: [ :symName | 
			aTokenStream next.
			symName = 'with-meta'
				ifTrue: [ |val meta|
					meta := self readForm: aTokenStream.
					val := self readForm: aTokenStream.
					^ MalList
						with: (MalSymbol withValue: symName)
						with: val
						with: meta ].
			^ MalList
				with: (MalSymbol withValue: symName)
				with: (self readForm: aTokenStream) ].
	^ self readAtom: aTokenStream
]

{ #category : #parsing }
MalReader class >> readList: aTokenStream withClose: delimiter [
	| items current finished |
	items := OrderedCollection new.
	finished := false.
	"Always initialised, but the browser can't see that the 
	loop is executed at least once.."
	current := nil.
	[ finished ]
		whileFalse: [ current := aTokenStream peek.
			(self isClose: current expected: delimiter)
				ifTrue: [ finished := true.
					aTokenStream next ]
				ifFalse: [ items add: (self readForm: aTokenStream) ] ].
	(self isClose: current expected: delimiter)
		ifFalse: [ MalError signal: 'Unclosed ( [ or {' ].
	delimiter = ']'
		ifTrue: [ ^ MalVector withValue: items ].
	delimiter = '}'
		ifTrue: [ ^ MalHashMap withItems: items ].
	^ MalList withValue: items
]

{ #category : #parsing }
MalReader class >> readString: aString [
	"Lex and parse a string of MAL source code."

	| tokens stream |
	tokens := MalTokenizer fromString: aString.
	stream := tokens readStream.
	^ self readForm: stream
]
