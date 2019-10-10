"
The built-in function / in MAL.
"
Class {
	#name : #MalDivide,
	#superclass : #MalFunction,
	#category : #MakeALisp
}

{ #category : #accessing }
MalDivide class >> malName [
^ '/'
]

{ #category : #accessing }
MalDivide >> call: args withContext: ctx [
	"Divide args together. TODO: arity error"

	| result |
	self ensure: args haveMinArity: 1.
	self ensure: args haveType: MalInteger.
	result := args first value.
	args allButFirstDo: [ :arg | result := result // arg value ].
	^ MalInteger withValue: result
]
