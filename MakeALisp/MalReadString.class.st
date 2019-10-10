"
I represent the read-string built-in function in MAL.
"
Class {
	#name : #MalReadString,
	#superclass : #MalFunctionOneArg,
	#category : #MakeALisp
}

{ #category : #accessing }
MalReadString class >> malName [
	^ 'read-string'
]

{ #category : #evaluating }
MalReadString >> callArg: arg withContext: ctx [
	arg class = MalString
		ifFalse: [ ^ MalError signal: 'Expected a string' ].
	^ Mal read: arg value
]
