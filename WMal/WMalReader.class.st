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
WMalReader class >> readAtom: aStream [
	"Parse a single mal type."

	^ WMalInteger withValue: aStream next asInteger
]

{ #category : #'as yet unclassified' }
WMalReader class >> readForm: aTokenStream [
	^ self readAtom: aTokenStream
]

{ #category : #'as yet unclassified' }
WMalReader class >> readList: aTokenStream [
	^ self readAtom: aTokenStream
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
