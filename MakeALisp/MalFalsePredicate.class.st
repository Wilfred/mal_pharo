"
I represent the false? function.
"
Class {
	#name : #MalFalsePredicate,
	#superclass : #MalFunctionOneArg,
	#category : #MakeALisp
}

{ #category : #accessing }
MalFalsePredicate class >> malName [
	^ 'false?'
]

{ #category : #evaluating }
MalFalsePredicate >> callArg: arg withContext: ctx [
	^ MalBool withValue: (arg = (MalBool withValue: false))
]
