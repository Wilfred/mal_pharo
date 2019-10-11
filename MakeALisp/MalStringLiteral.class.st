"
I convert strings '""foo""' into MAL strings.
"
Class {
	#name : #MalStringLiteral,
	#superclass : #MalLiteral,
	#category : #MakeALisp
}

{ #category : #testing }
MalStringLiteral class >> fromToken: token [
	^ MalString withValue: (self stringContents: token)
]

{ #category : #testing }
MalStringLiteral class >> matches: aString [
	^ aString first = $"
]

{ #category : #testing }
MalStringLiteral class >> stringContents: token [
	| chars isEscape |
	"Remove the double quotes and unescape a string literal."
	token = '"'
		ifTrue: [ MalError signal: 'unbalanced string literal (missing closing ")' ].
	isEscape := false.
	chars := OrderedCollection new.
	token allButFirst allButLast
		do: [ :char | 
			isEscape
				ifTrue: [ chars add: (self unescapeChar: char).
					isEscape := false ]
				ifFalse: [ char = $\
						ifTrue: [ isEscape := true ]
						ifFalse: [ chars add: char ] ] ].
	^ '' join: chars
]

{ #category : #testing }
MalStringLiteral class >> unescapeChar: char [
	| escapeChars |
	"Converts 'n' from '\n' to a newline and so on."
	escapeChars := Dictionary
		with: $n -> Character lf
		with: $r -> Character cr.
	^ escapeChars at: char ifAbsent: char
]
