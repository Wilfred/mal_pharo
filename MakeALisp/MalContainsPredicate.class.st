"
I represent the contains? function.
"
Class {
	#name : #MalContainsPredicate,
	#superclass : #MalFunction,
	#category : #MakeALisp
}

{ #category : #accessing }
MalContainsPredicate class >> malName [
	^ 'contains?'
]

{ #category : #evaluating }
MalContainsPredicate >> call: args withContext: ctx [
	| hashmap |
	self ensure: args haveArity: 2.
	hashmap := args first.
	hashmap class = MalHashMap
		ifFalse: [ MalError signal: 'first argument to contains must be a hash map' ].
	^ hashmap value at: args second ifPresent: [ MalBool withValue: true ] ifAbsent: [ MalBool withValue: false ]
]
