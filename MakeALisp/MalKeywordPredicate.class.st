"
I represent the keyword? function.
"
Class {
	#name : #MalKeywordPredicate,
	#superclass : #MalFunctionOneArg,
	#category : #MakeALisp
}

{ #category : #accessing }
MalKeywordPredicate class >> malName [
	^ 'keyword?'
]

{ #category : #evaluating }
MalKeywordPredicate >> callArg: arg withContext: ctx [

	^ MalBool withValue: arg class = MalKeyword
]
