"
I represent the first function.
"
Class {
	#name : #MalFirst,
	#superclass : #MalFunctionOneArg,
	#category : #MakeALisp
}

{ #category : #accessing }
MalFirst class >> malName [
	^ 'first'
]

{ #category : #evaluating }
MalFirst >> callArg: arg withContext: ctx [
	arg isPair
	   ifTrue: [ ^ arg value first ]
		ifFalse: [ ^ MalNil new ].

]
