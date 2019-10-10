"
I represent the keys function.
"
Class {
	#name : #MalKeys,
	#superclass : #MalFunctionOneArg,
	#category : #MakeALisp
}

{ #category : #accessing }
MalKeys class >> malName [
	^ 'keys'
]

{ #category : #evaluating }
MalKeys >> callArg: arg withContext: ctx [
	arg class = MalHashMap
		ifFalse: [ MalError signal: 'keys requires a hash map argument' ].
	^ MalList withValue: (OrderedCollection newFrom: arg value keys)
]
