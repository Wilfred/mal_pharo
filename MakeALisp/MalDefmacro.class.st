"
I represent the defmacro! special form.
"
Class {
	#name : #MalDefmacro,
	#superclass : #MalSpecialForm,
	#category : #MakeALisp
}

{ #category : #evaluating }
MalDefmacro class >> call: args withContext: ctx [
	| sym val |
	args size = 2
		ifFalse: [ MalWrongArity
				signal: ('defmacro! requires 2 arguments (got {1}' format: {args size}) ].
	sym := args first.
	sym class = MalSymbol
		ifFalse: [ MalError signal: 'The first argument to def! must be a symbol' ].
	val := args second evalIn: ctx.
	"Ensure we don't modify the original function."
	val := val copy.
	val isMacro: true.
	ctx globalEnv at: sym put: val.
	^ val
]

{ #category : #accessing }
MalDefmacro class >> malName [
	^ 'defmacro!'
]
