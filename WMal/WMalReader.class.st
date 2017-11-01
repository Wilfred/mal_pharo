"
I convert MAL source code to an AST instance of WMalType.
"
Class {
	#name : #WMalReader,
	#superclass : #Object,
	#instVars : [
		'tokens',
		'index'
	],
	#category : #WMal
}

{ #category : #'as yet unclassified' }
WMalReader class >> readAtom: aStream [
	"Parse a single mal type."

	| token |
	token := aStream next.
	token isAllDigits
		ifTrue: [ ^ WMalInteger withValue: token asInteger ].
	token = 'nil'
		ifTrue: [ ^ WMalNil new ].
	token = 'true'
		ifTrue: [ ^ WMalBool withValue: true ].
	token = 'false'
		ifTrue: [ ^ WMalBool withValue: false ].
	^ WMalSymbol withValue: token
]

{ #category : #'as yet unclassified' }
WMalReader class >> readForm: aTokenStream [
	| current |
	current := aTokenStream peek.
	current = '('
		ifTrue: [ aTokenStream next.
			^ self readList: aTokenStream ]
		ifFalse: [ ^ self readAtom: aTokenStream ]
]

{ #category : #'as yet unclassified' }
WMalReader class >> readList: aTokenStream [
	| items current finished |
	items := OrderedCollection new.
	finished := false.
	[ finished ]
		whileFalse: [ current := aTokenStream peek.
			Transcript
				show: current;
				cr.
			current = ')'
				ifTrue: [ finished := true. aTokenStream next. ]
				ifFalse: [ items add: (self readForm: aTokenStream) ] ].
	self assert: current = ')' description: 'Unclosed ('.
	^ WMalList withValue: items
]

{ #category : #'as yet unclassified' }
WMalReader class >> readString: aString [
	"Lex and parse a string of MAL source code."

	| parsed tokens |
	parsed := OrderedCollection new.
	tokens := (WMalTokenizer withSource: aString) tokenize.
	^self readForm: tokens readStream
]
