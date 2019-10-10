"
I represent the symbol function.
"
Class {
	#name : #MalSymbolFunction,
	#superclass : #MalFunctionOneArg,
	#category : #MakeALisp
}

{ #category : #accessing }
MalSymbolFunction class >> malName [
	^ 'symbol'
]

{ #category : #evaluating }
MalSymbolFunction >> callArg: arg withContext: ctx [
	arg class = MalString
		ifFalse: [ MalError signal: 'symbol requires a string argument' ].
	^ MalSymbol withValue: arg value
]
