"
I represent the str built-in function in MAL.
"
Class {
	#name : #MalStr,
	#superclass : #MalFunction,
	#category : #MakeALisp
}

{ #category : #accessing }
MalStr class >> malName [
	^ 'str'
]

{ #category : #evaluating }
MalStr >> call: args withContext: ctx [
	| stringArgs |
	stringArgs := args collect: #asString.
	^ MalString withValue: ('' join: stringArgs)
]
