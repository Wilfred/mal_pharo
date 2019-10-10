"
I represent the keyword function.
"
Class {
	#name : #MalKeywordFunction,
	#superclass : #MalFunctionOneArg,
	#category : #MakeALisp
}

{ #category : #accessing }
MalKeywordFunction class >> malName [
	^ 'keyword'
]

{ #category : #evaluating }
MalKeywordFunction >> callArg: arg withContext: ctx [
	arg class = MalString
		ifFalse: [ MalError signal: 'keyword requires a string argument' ].
	^ MalKeyword withValue: ':' ,arg value
]
