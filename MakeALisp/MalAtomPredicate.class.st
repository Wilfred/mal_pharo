"
I represent the atom? function in MAL.
"
Class {
	#name : #MalAtomPredicate,
	#superclass : #MalFunctionOneArg,
	#category : #MakeALisp
}

{ #category : #accessing }
MalAtomPredicate class >> malName [
	^ 'atom?'
]

{ #category : #evaluating }
MalAtomPredicate >> callArg: arg withContext: ctx [
	^ MalBool withValue: (arg class = MalAtom)
]
