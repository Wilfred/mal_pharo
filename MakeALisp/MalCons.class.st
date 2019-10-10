"
I represent the cons function in MAL.
"
Class {
	#name : #MalCons,
	#superclass : #MalFunction,
	#category : #MakeALisp
}

{ #category : #accessing }
MalCons class >> malName [
	^ 'cons'
]

{ #category : #evaluating }
MalCons >> call: args withContext: ctx [
	| result |
	self ensure: args haveArity: 2.
	result := OrderedCollection with: args first.
	args second isIterable
		ifFalse: [ MalError signal: 'second argument to cons should be iterable' ].
	result addAll: args second value.
	^ MalList withValue: result
]
