"
I represent the >= function in MAL.
"
Class {
	#name : #MalGreaterThanOrEqual,
	#superclass : #MalFunction,
	#category : #MakeALisp
}

{ #category : #accessing }
MalGreaterThanOrEqual class >> malName [
^ '>='
]

{ #category : #accessing }
MalGreaterThanOrEqual >> call: args withContext: ctx [
	| x y |
	self ensure: args haveArity: 2.
	self ensure: args haveType: MalInteger.
	x := args first.
	y := args second.
	^ MalBool withValue: x value >= y value
]
