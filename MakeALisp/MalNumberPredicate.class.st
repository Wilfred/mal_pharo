"
I represent the number? function.
"
Class {
	#name : #MalNumberPredicate,
	#superclass : #MalFunctionOneArg,
	#category : #MakeALisp
}

{ #category : #accessing }
MalNumberPredicate class >> malName [
	^ 'number?'
]

{ #category : #evaluating }
MalNumberPredicate >> callArg: arg withContext: ctx [
	^ MalBool withValue: arg class = MalInteger
]
