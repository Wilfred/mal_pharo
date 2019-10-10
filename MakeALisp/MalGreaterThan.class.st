"
I represent the > function in MAL.
"
Class {
	#name : #MalGreaterThan,
	#superclass : #MalFunction,
	#category : #MakeALisp
}

{ #category : #accessing }
MalGreaterThan class >> malName [
^ '>'
]

{ #category : #accessing }
MalGreaterThan >> call: args withContext: ctx [
	| x y |
	self ensure: args haveArity: 2.
	self ensure: args haveType: MalInteger .
	x := args first.
	y := args second.
	^ MalBool withValue: x value > y value
]
