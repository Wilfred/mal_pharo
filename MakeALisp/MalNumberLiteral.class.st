"
I convert number literals to number values in MAL.
"
Class {
	#name : #MalNumberLiteral,
	#superclass : #MalLiteral,
	#category : #MakeALisp
}

{ #category : #testing }
MalNumberLiteral class >> fromToken: token [
	^ MalInteger withValue: token asInteger
]

{ #category : #testing }
MalNumberLiteral class >> matches: token [
	^ token isAllDigits
		| (token first = $- & token allButFirst isAllDigits)
]
