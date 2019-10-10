"
I represent the true? function.
"
Class {
	#name : #MalTruePredicate,
	#superclass : #MalFunctionOneArg,
	#category : #MakeALisp
}

{ #category : #accessing }
MalTruePredicate class >> malName [
	^ 'true?'
]

{ #category : #evaluating }
MalTruePredicate >> callArg: arg withContext: ctx [
	^ MalBool withValue: (arg = (MalBool withValue: true))
]
