"
I represent the eval built-in function in MAL.

I do not handle evaluation (see the evalIn: message), but I expose evaluation to the user.
"
Class {
	#name : #MalEval,
	#superclass : #MalFunctionOneArg,
	#category : #MakeALisp
}

{ #category : #accessing }
MalEval class >> malName [
	^ 'eval'
]

{ #category : #evaluating }
MalEval >> callArg: arg withContext: ctx [
	| evalCtx |
	"Eval may not access local variables, according to the MAL test suite."
	evalCtx := ctx withEnv: ctx globalEnv.
	^ arg evalIn: evalCtx
]
