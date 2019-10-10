"
I represent the def! special form in MAL.
"
Class {
	#name : #MalDef,
	#superclass : #MalSpecialForm,
	#category : #MakeALisp
}

{ #category : #evaluating }
MalDef class >> call: args withContext: ctx [
	| sym val |
	args size = 2
		ifFalse: [ MalWrongArity
				signal: ('def! requires 2 arguments (got {1}' format: {args size}) ].
	sym := args first.
	sym class = MalSymbol
		ifFalse: [ MalError signal: 'The first argument to def! must be a symbol' ].
	val := args second evalIn: ctx.
	ctx globalEnv at: sym put: val.
	^ val
]

{ #category : #accessing }
MalDef class >> malName [
	^ 'def!'
]
