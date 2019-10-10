"
I represent let* in MAL.
"
Class {
	#name : #MalLet,
	#superclass : #MalSpecialForm,
	#category : #MakeALisp
}

{ #category : #evaluating }
MalLet class >> call: args withContext: ctx [
	| newEnv bindings result newCtx |
	args isEmpty
		ifTrue: [ MalWrongArity signal: 'let* requires a list of bindings' ].
	newEnv := MalEnv withOuter: ctx env.
	newCtx := ctx withEnv: newEnv.
	bindings := args first.
	({ MalList. MalVector } includes: (bindings class))
		ifFalse: [ MalError signal: 'let* requires a list of bindings' ].
	(bindings value size isDivisibleBy: 2)
		ifFalse: [ MalError signal: 'let* requires an even number of bindings' ].
	bindings value
		withIndexDo: [ :b :i | 
			(i isDivisibleBy: 2)
				ifFalse: [ b class = MalSymbol
						ifFalse: [ MalError signal: 'Expected a symbol for let binding' ] ] ].
	bindings value
		pairsDo: [ :var :rawVal | 
			| val |
			val := rawVal evalIn: newCtx.
			newCtx env at: var put: val ].
	result := nil.
	args allButFirst do: [ :expr | result := expr evalIn: newCtx ].
	^ result
]

{ #category : #accessing }
MalLet class >> malName [
	^ 'let*'
]
