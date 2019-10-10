"
I represent the try* special form.
"
Class {
	#name : #MalTry,
	#superclass : #MalSpecialForm,
	#category : #MakeALisp
}

{ #category : #evaluating }
MalTry class >> call: args withContext: ctx [
	| catchExpr |
	args isEmpty
		ifTrue: [ MalError signal: 'try* requires at least one argument' ].
	catchExpr := nil.
	args size = 2
		ifTrue: [ catchExpr := args second ].
	catchExpr ifNil: [ ^ args first evalIn: ctx ].
	^ [ args first evalIn: ctx ]
		on: MalError
		do: [ :ex | self evalCatch: catchExpr withException: ex andContext: ctx ]
]

{ #category : #accessing }
MalTry class >> evalCatch: expr withException: ex andContext: ctx [
	"Evaluate a (catch* exc ...) expression."

	| excValue newEnv newCtx excSym |
	expr isPair
		ifFalse: [ MalError signal: 'catch* expression must be a non-empty list' ].
	expr value first = (MalSymbol withValue: 'catch*')
		ifFalse: [ MalError signal: 'catch* expression must start with catch*' ].
	expr size = 3
		ifFalse: [ MalError
				signal: 'catch* expression is wrong size: should be catch*, sym, expr' ].
	excSym := expr value second.
	excSym class = MalSymbol
		ifFalse: [ MalError signal: 'catch* requires a symbol to bind the exception' ].
	"Use the value passed to throw, or the error text for built-in errors."
	excValue := (ex tag isKindOf: MalType)
		ifTrue: [ ex tag ]
		ifFalse: [ MalString withValue: ex messageText ].
	newEnv := MalEnv withOuter: ctx env.
	newEnv at: excSym put: excValue.
	newCtx := ctx withEnv: newEnv.
	^ expr value third evalIn: newCtx
]

{ #category : #accessing }
MalTry class >> malName [
	^ 'try*'
]
