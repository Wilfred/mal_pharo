"
The built-in function * in MAL.
"
Class {
	#name : #MalMultiply,
	#superclass : #MalFunction,
	#category : #MakeALisp
}

{ #category : #accessing }
MalMultiply class >> malName [
^ '*'
]

{ #category : #accessing }
MalMultiply >> call: args withContext: ctx [
	"Multiply args together."

	| total |
		self ensure: args haveType: MalInteger.
	total := 1.
	args do: [ :arg | total := total * arg value ].
	^ MalInteger withValue: total
]
