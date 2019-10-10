"
I represent the swap! function in MAL.
"
Class {
	#name : #MalSwap,
	#superclass : #MalFunction,
	#category : #MakeALisp
}

{ #category : #accessing }
MalSwap class >> malName [
	^ 'swap!'
]

{ #category : #evaluating }
MalSwap >> call: args withContext: ctx [
	| atom func funcArgs newValue |
		self ensure: args haveMinArity: 2.
	atom := args first.
	atom class = MalAtom
		ifFalse: [ MalError signal: 'first argument to swap! must be an atom' ].
	func := args second.
	func isCallable
		ifFalse: [ MalError signal: 'second argument to swap! must be a function' ].
	funcArgs := OrderedCollection with: atom value.
	funcArgs addAll: (args allButFirst: 2).
	newValue := func call: funcArgs withContext: ctx.
	atom value: newValue.
	^ newValue
]
