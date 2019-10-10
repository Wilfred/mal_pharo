"
I represent the conj function.
"
Class {
	#name : #MalConj,
	#superclass : #MalFunction,
	#category : #MakeALisp
}

{ #category : #accessing }
MalConj class >> malName [
	^ 'conj'
]

{ #category : #evaluating }
MalConj >> call: args withContext: ctx [
	| items extraItems |
	self ensure: args haveMinArity: 1.
	args first isIterable
		ifFalse: [ MalError signal: 'conj requires an iterable as its first argument' ].
	items := args first value copy.
	extraItems := args allButFirst.
	args first class = MalList
		ifTrue: [ extraItems do: [ :item | items addFirst: item ].
			^MalList withValue: items ]
		ifFalse: [ extraItems do: [ :item | items addLast: item ].
			^MalVector withValue: items ]
]
