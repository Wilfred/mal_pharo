"
I represent the macroexpand special form exposed to the user.

For internal macro expansion logic, see implementors of macroexpandIn:.
"
Class {
	#name : #MalMacroexpand,
	#superclass : #MalSpecialForm,
	#category : #MakeALisp
}

{ #category : #evaluating }
MalMacroexpand class >> call: args withContext: ctx [
	args size = 1
		ifFalse: [ MalWrongArity signal: 'macroexpand takes one argument' ].
	^ args first macroexpandAllIn: ctx
]

{ #category : #accessing }
MalMacroexpand class >> malName [
	^ 'macroexpand'
]
