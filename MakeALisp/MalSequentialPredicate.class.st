"
I represent the sequential? function.
"
Class {
	#name : #MalSequentialPredicate,
	#superclass : #MalFunctionOneArg,
	#category : #MakeALisp
}

{ #category : #accessing }
MalSequentialPredicate class >> malName [
	^ 'sequential?'
]

{ #category : #evaluating }
MalSequentialPredicate >> callArg: arg withContext: ctx [
	^ MalBool withValue: arg isIterable 
]
