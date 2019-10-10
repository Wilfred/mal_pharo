"
I represent the built-in throw function.
"
Class {
	#name : #MalThrow,
	#superclass : #MalFunctionOneArg,
	#category : #MakeALisp
}

{ #category : #accessing }
MalThrow class >> malName [
	^ 'throw'
]

{ #category : #evaluating }
MalThrow >> callArg: arg withContext: ctx [
	MalError signal: 'Exception: ' , arg asReadableString  withTag: arg
]
