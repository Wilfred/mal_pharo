"
I represent the map function.
"
Class {
	#name : #MalMapFunction,
	#superclass : #MalFunction,
	#category : #MakeALisp
}

{ #category : #accessing }
MalMapFunction class >> malName [
	^ 'map'
]

{ #category : #evaluating }
MalMapFunction >> call: args withContext: ctx [
	| func result |
	self ensure: args haveArity: 2.
	func := args first.
	func isCallable
		ifFalse: [ MalError signal: 'first argument to map must be a callable' ].
	result := OrderedCollection new.
	args second isIterable
		ifFalse: [ MalError signal: 'the second argument to map must be iterable' ].
	result := args second value collect: [ :arg | func call: (OrderedCollection with: arg) withContext: ctx ].
	^ MalList withValue: result
]
