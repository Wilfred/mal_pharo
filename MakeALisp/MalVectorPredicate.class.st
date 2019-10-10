"
I represent the vector? function.
"
Class {
	#name : #MalVectorPredicate,
	#superclass : #MalFunctionOneArg,
	#category : #MakeALisp
}

{ #category : #accessing }
MalVectorPredicate class >> malName [
	^ 'vector?'
]

{ #category : #evaluating }
MalVectorPredicate >> callArg: arg withContext: ctx [
	^ MalBool withValue: arg class = MalVector
]
