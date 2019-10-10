"
The built-in function - in MAL.
"
Class {
	#name : #MalSubtract,
	#superclass : #MalFunction,
	#category : #MakeALisp
}

{ #category : #accessing }
MalSubtract class >> malName [
^ '-'
]

{ #category : #accessing }
MalSubtract >> call: args withContext: ctx [
	"Subtract args."

	| total |
	self ensure: args haveType: MalInteger.
	args ifEmpty: [ ^ MalInteger withValue: 0 ].
	args size = 1
		ifTrue: [ ^ MalInteger withValue: args first value negated ].
	total := args first value.
	args allButFirst do: [ :arg | total := total - arg value ].
	^ MalInteger withValue: total
]
