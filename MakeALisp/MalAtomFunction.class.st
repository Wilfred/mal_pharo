"
I represent the function that creates atom values in MAL.
"
Class {
	#name : #MalAtomFunction,
	#superclass : #MalFunctionOneArg,
	#category : #MakeALisp
}

{ #category : #accessing }
MalAtomFunction class >> malName [
	^ 'atom'
]

{ #category : #evaluating }
MalAtomFunction >> callArg: arg withContext: ctx [
	^ MalAtom withValue: arg
]
