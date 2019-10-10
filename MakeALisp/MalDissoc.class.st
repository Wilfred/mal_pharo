"
I represent the dissoc function.
"
Class {
	#name : #MalDissoc,
	#superclass : #MalFunction,
	#category : #MakeALisp
}

{ #category : #accessing }
MalDissoc class >> malName [
	^ 'dissoc'
]

{ #category : #evaluating }
MalDissoc >> call: args withContext: ctx [
	| items keysToRemove |
	args isEmpty
		ifTrue: [ MalError signal: 'dissoc requires an argument' ].
	args first class = MalHashMap
		ifFalse: [ MalError signal: 'first argument to dissoc must be a hash map' ].
	items := args first value copy.
	keysToRemove := args allButFirst.
	keysToRemove do: [ :k | items removeKey: k ifAbsent: [  ] ].
	^ MalHashMap withValue: items
]
