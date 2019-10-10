"
I represent the string? function.
"
Class {
	#name : #MalStringPredicate,
	#superclass : #MalFunctionOneArg,
	#category : #MakeALisp
}

{ #category : #accessing }
MalStringPredicate class >> malName [
	^ 'string?'
]

{ #category : #evaluating }
MalStringPredicate >> callArg: arg withContext: ctx [
	^ MalBool withValue: arg class = MalString
]
