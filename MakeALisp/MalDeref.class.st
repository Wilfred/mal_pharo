"
I represent the deref function in MAL.
"
Class {
	#name : #MalDeref,
	#superclass : #MalFunctionOneArg,
	#category : #MakeALisp
}

{ #category : #accessing }
MalDeref class >> malName [
	^ 'deref'
]

{ #category : #evaluating }
MalDeref >> callArg: arg withContext: env [
	arg class = MalAtom ifFalse: [ MalError signal: 'deref requires an atom' ].
	^ arg value
]
