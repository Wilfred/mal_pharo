"
I represent the empty? function in MAL.
"
Class {
	#name : #MalEmptyPredicate,
	#superclass : #MalFunctionOneArg,
	#category : #MakeALisp
}

{ #category : #accessing }
MalEmptyPredicate class >> malName [
^ 'empty?'
]

{ #category : #evaluating }
MalEmptyPredicate >> callArg: arg withContext: ctx [
	arg isIterable
		ifFalse: [ ^ MalBool withValue: false ].
	^ MalBool withValue: arg value isEmpty
]
