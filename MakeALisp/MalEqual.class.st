"
I represent the = function in MAL.
"
Class {
	#name : #MalEqual,
	#superclass : #MalFunction,
	#category : #MakeALisp
}

{ #category : #accessing }
MalEqual class >> malName [
^ '='
]

{ #category : #evaluating }
MalEqual >> call: args withContext: ctx [
	self ensure: args haveArity: 2.
	^ MalBool withValue: args first = args second
]
