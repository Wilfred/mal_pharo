"
I represent the nil? function.
"
Class {
	#name : #MalNilPredicate,
	#superclass : #MalFunctionOneArg,
	#category : #MakeALisp
}

{ #category : #accessing }
MalNilPredicate class >> malName [
	^ 'nil?'
]

{ #category : #evaluating }
MalNilPredicate >> callArg: arg withContext: ctx [
	^ MalBool withValue: (arg = (MalNil new))
]
