"
I represent the concat function in MAL.
"
Class {
	#name : #MalConcat,
	#superclass : #MalFunction,
	#category : #MakeALisp
}

{ #category : #accessing }
MalConcat class >> malName [
	^ 'concat'
]

{ #category : #evaluating }
MalConcat >> call: args withContext: ctx [
	| result |
	args do: [ :arg | arg isIterable ifFalse: [ MalError signal: 'concat requires iterable arguments' ] ].
	result := OrderedCollection new.
	args do: [ :arg | result addAll: arg value ].
	^ MalList withValue: result
]
