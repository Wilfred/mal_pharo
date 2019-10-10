"
I represent the macro? function.
"
Class {
	#name : #MalMacroPredicate,
	#superclass : #MalFunctionOneArg,
	#category : #MakeALisp
}

{ #category : #accessing }
MalMacroPredicate class >> malName [
	^ 'macro?'
]

{ #category : #evaluating }
MalMacroPredicate >> callArg: arg withContext: ctx [
	^ MalBool withValue: arg isMacro
]
