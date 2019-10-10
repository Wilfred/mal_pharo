"
I represent the get function.
"
Class {
	#name : #MalGet,
	#superclass : #MalFunction,
	#category : #MakeALisp
}

{ #category : #accessing }
MalGet class >> malName [
	^ 'get'
]

{ #category : #evaluating }
MalGet >> call: args withContext: ctx [
	| hashmap |
	self ensure: args haveArity: 2.
	hashmap := args first.
	hashmap class = MalHashMap
		ifFalse: [ ^ MalNil new ].
	^ hashmap value at: args second ifAbsent: [ MalNil new ]
]
