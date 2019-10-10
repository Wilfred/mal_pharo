"
I represent the if special form in MAL.
"
Class {
	#name : #MalIf,
	#superclass : #MalSpecialForm,
	#category : #MakeALisp
}

{ #category : #evaluating }
MalIf class >> call: args withContext: ctx [
	| condition result |
	args size < 2
		ifTrue: [ MalWrongArity signal: 'if requires at least two arguments' ].
	condition := args first evalIn: ctx.
	condition isTruthy
		ifTrue: [ ^ args second evalIn: ctx ].
	result := MalNil new.
	(args allButFirst: 2) do: [ :arg | result := arg evalIn: ctx ].
	^ result
]

{ #category : #accessing }
MalIf class >> malName [
	^ 'if'
]
