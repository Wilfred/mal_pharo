"
I represent the nth function.
"
Class {
	#name : #MalNth,
	#superclass : #MalFunction,
	#category : #MakeALisp
}

{ #category : #accessing }
MalNth class >> malName [
	^ 'nth'
]

{ #category : #evaluating }
MalNth >> call: args withContext: ctx [
	self ensure: args haveArity: 2.
	args first isIterable
		ifFalse: [ MalError signal: 'first argument to nth should be iterable' ].
	args second class = MalInteger
		ifFalse: [ MalError signal: 'second argument to nth should be an integer' ].
	[ ^ args first value at: args second value + 1 ]
		on: SubscriptOutOfBounds
		do: [ MalError
				signal:
					('Out of bounds: cannot access {1} in a {2} item iterable'
						format:
							{args second value.
							args first size}) ]
]
