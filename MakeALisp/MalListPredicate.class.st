"
I represent the list? function in MAL.
"
Class {
	#name : #MalListPredicate,
	#superclass : #MalFunctionOneArg,
	#category : #MakeALisp
}

{ #category : #accessing }
MalListPredicate class >> malName [
^ 'list?'
]

{ #category : #evaluating }
MalListPredicate >> callArg: arg withContext: ctx [
	^ MalBool withValue: arg class = MalList
]
