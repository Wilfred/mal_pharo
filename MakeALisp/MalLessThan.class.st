"
I represent the < function in MAL.
"
Class {
	#name : #MalLessThan,
	#superclass : #MalFunction,
	#category : #MakeALisp
}

{ #category : #accessing }
MalLessThan class >> malName [
^ '<'
]

{ #category : #accessing }
MalLessThan >> call: args withContext: ctx [
	| x y |
	self ensure: args haveArity: 2.
	self ensure: args haveType: MalInteger.
	x := args first.
	y := args second.
	^ MalBool withValue: x value < y value
]
