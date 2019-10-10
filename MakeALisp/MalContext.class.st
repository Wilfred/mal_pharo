"
I represent the state needed to evaluate MAL expressions.

To evaluate MAl programs with a full environment use:

MalContext default.
"
Class {
	#name : #MalContext,
	#superclass : #Object,
	#instVars : [
		'env',
		'stdout'
	],
	#category : #MakeALisp
}

{ #category : #accessing }
MalContext class >> default [
	"Initialise the MAL context with a full environment."

	| ctx |
	ctx := self new
		env: MalEnv default;
		yourself.
	(Mal read: (Mal prelude)) evalIn: ctx .
	^ ctx
]

{ #category : #accessing }
MalContext >> env [
	^ env
]

{ #category : #accessing }
MalContext >> env: bindings [
	env := bindings
]

{ #category : #accessing }
MalContext >> globalEnv [
	| result |
	result := env.
	[ result outer isNotNil  ] whileTrue: [ result := result outer ].
   ^ result
]

{ #category : #'as yet unclassified' }
MalContext >> setArgv: cliArgs [
	| argv args |
	args := cliArgs arguments.
	argv := MalList withValue: (args collect: [:arg | MalString withValue: arg]).
	env at: (MalSymbol withValue: '*ARGV*') put: argv
]

{ #category : #accessing }
MalContext >> stdout [
	^ stdout
]

{ #category : #accessing }
MalContext >> stdout: anObject [
	stdout := anObject
]

{ #category : #accessing }
MalContext >> withEnv: newEnv [
"Return a copy of self with a different environment."
	^ self class
		new
		env: newEnv;
		stdout: stdout;
		yourself
]
