"
I represent the fn? function.
"
Class {
	#name : #MalFnPredicate,
	#superclass : #MalFunctionOneArg,
	#category : #MakeALisp
}

{ #category : #accessing }
MalFnPredicate class >> malName [
	^ 'fn?'
]

{ #category : #evaluating }
MalFnPredicate >> callArg: arg withContext: ctx [
	^ MalBool withValue: (arg isCallable and: [arg isMacro not])
]
