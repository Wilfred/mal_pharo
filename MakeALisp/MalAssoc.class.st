"
I represent the assoc function.
"
Class {
	#name : #MalAssoc,
	#superclass : #MalFunction,
	#category : #MakeALisp
}

{ #category : #accessing }
MalAssoc class >> malName [
	^ 'assoc'
]

{ #category : #evaluating }
MalAssoc >> call: args withContext: ctx [
	| items extraItems |
	args isEmpty
		ifTrue: [ MalError signal: 'assoc requires an argument' ].
	args first class = MalHashMap
		ifFalse: [ MalError signal: 'first argument to assoc must be a hash map' ].
	items := args first value copy.
	extraItems := args allButFirst.
	extraItems size even
		ifFalse: [ MalError signal: 'assoc requires an even number of key-values' ].
	extraItems pairsDo: [ :k :v | items at: k put: v ].
	^ MalHashMap withValue: items
]
