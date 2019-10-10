"
I represent the reset! function in MAL.
"
Class {
	#name : #MalReset,
	#superclass : #MalFunction,
	#category : #MakeALisp
}

{ #category : #accessing }
MalReset class >> malName [
	^ 'reset!'
]

{ #category : #evaluating }
MalReset >> call: args withContext: ctx [
	| atom |
	self ensure: args haveArity: 2.
	atom := args first.
	atom class = MalAtom
		ifFalse: [ MalError signal: 'first argument to reset! must be an atom' ].
	atom value: args second.
	^ args second
]
