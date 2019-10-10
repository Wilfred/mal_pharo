"
I convert strings ':foo' into MalKeyword values.
"
Class {
	#name : #MalKeywordLiteral,
	#superclass : #MalLiteral,
	#category : #MakeALisp
}

{ #category : #testing }
MalKeywordLiteral class >> fromToken: aString [
	^ MalKeyword withValue: aString
]

{ #category : #testing }
MalKeywordLiteral class >> matches: aString [
	^ aString first = $:
]
