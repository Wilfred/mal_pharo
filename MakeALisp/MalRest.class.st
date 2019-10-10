"
I represent the rest function.
"
Class {
	#name : #MalRest,
	#superclass : #MalFunctionOneArg,
	#category : #MakeALisp
}

{ #category : #accessing }
MalRest class >> malName [
	^ 'rest'
]

{ #category : #evaluating }
MalRest >> callArg: arg withContext: ctx [
	arg class = MalNil ifTrue: [ ^ MalList new ].
	arg isIterable
		ifFalse: [ ^ MalNil new ].
	^ MalList withValue: arg value allButFirst
]
