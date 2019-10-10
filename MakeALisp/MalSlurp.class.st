"
I represent the slurp built-in function in MAL.
"
Class {
	#name : #MalSlurp,
	#superclass : #MalFunctionOneArg,
	#category : #MakeALisp
}

{ #category : #accessing }
MalSlurp class >> malName [
	^ 'slurp'
]

{ #category : #evaluating }
MalSlurp >> callArg: arg withContext: ctx [
	arg class = MalString
		ifFalse: [ ^ MalError signal: 'Expected a string' ].
	^ MalString withValue: (arg value asFileReference readStream upToEnd)
]
