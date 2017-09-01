"
I convert tokens to (possibly nested) forms.
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
WMalReader class >> readAtom: aString [
	"Parse a single mal type."

	|  |
	^ WMalInteger withValue: aString
]

{ #category : #'as yet unclassified' }
WMalReader class >> readForm: aTokenStream [
	^ self readAtom: (aTokenStream next)
]

{ #category : #'as yet unclassified' }
WMalReader class >> readString: aString [
	"Parse a string into mal types."

	| parsed tokens |
	parsed := OrderedCollection new.
	tokens := (WMalTokenizer withSource: aString) tokenize.
	parsed add: (self readForm: tokens readStream).
	^ parsed
]
