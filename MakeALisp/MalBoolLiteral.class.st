"
I convert true and false strings to MAL values.
"
Class {
	#name : #MalBoolLiteral,
	#superclass : #MalLiteral,
	#category : #MakeALisp
}

{ #category : #testing }
MalBoolLiteral class >> fromToken: aString [
	aString = 'true' ifTrue: [ ^ MalBool withValue: true ] ifFalse: [ ^MalBool withValue: false ]
]

{ #category : #testing }
MalBoolLiteral class >> matches: aString [

	^ (aString = 'true') | (aString = 'false')
]
