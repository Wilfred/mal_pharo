"
I represent the vals function.
"
Class {
	#name : #MalVals,
	#superclass : #MalFunctionOneArg,
	#category : #MakeALisp
}

{ #category : #accessing }
MalVals class >> malName [
	^ 'vals'
]

{ #category : #evaluating }
MalVals >> callArg: arg withContext: ctx [
	arg class = MalHashMap
		ifFalse: [ MalError signal: 'vals requires a hash map argument' ].
	^ MalList withValue: (OrderedCollection newFrom: arg value values)
]
