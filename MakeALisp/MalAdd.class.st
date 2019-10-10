"
The built-in function + in MAL.
"
Class {
	#name : #MalAdd,
	#superclass : #MalFunction,
	#category : #MakeALisp
}

{ #category : #accessing }
MalAdd class >> malName [ 
^ '+'
]

{ #category : #evaluating }
MalAdd >> call: args withContext: ctx [
	"Add args together. TODO: type errors."

	| total |
	self ensure: args haveType: MalInteger.
	total := (args collect: #value) sum.
	^ MalInteger withValue: total
]
