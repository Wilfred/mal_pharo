"
I represent the symbol? function.
"
Class {
	#name : #MalSymbolPredicate,
	#superclass : #MalFunctionOneArg,
	#category : #MakeALisp
}

{ #category : #accessing }
MalSymbolPredicate class >> malName [
	^ 'symbol?'
]

{ #category : #evaluating }
MalSymbolPredicate >> callArg: arg withContext: ctx [
	^ MalBool withValue: arg class = MalSymbol
]
