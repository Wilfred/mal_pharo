"
I represent the hash-map function.
"
Class {
	#name : #MalHashMapFunction,
	#superclass : #MalFunction,
	#category : #MakeALisp
}

{ #category : #accessing }
MalHashMapFunction class >> malName [
	^ 'hash-map'
]

{ #category : #accessing }
MalHashMapFunction >> call: args withContext: ctx [
	args size even
		ifFalse: [ MalError signal: 'hash-map takes an even number of arguments' ].
	^ MalHashMap withItems: args
]
