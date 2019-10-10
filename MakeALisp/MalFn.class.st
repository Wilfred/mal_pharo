"
I represent the fn* special form, and create a MalClosure.
"
Class {
	#name : #MalFn,
	#superclass : #MalSpecialForm,
	#category : #MakeALisp
}

{ #category : #evaluating }
MalFn class >> call: args withContext: ctx [
	| wrappedParams params body variadicSym |
	args isEmpty
		ifTrue: [ MalWrongArity signal: 'fn* requires a list of parameters' ].
	wrappedParams := args first.
	wrappedParams isIterable
		ifFalse: [ MalError signal: 'fn* parameters must be iterable' ].
	params := wrappedParams value.
	variadicSym := nil.
	params
		doWithIndex: [ :param :i | 
			param class = MalSymbol
				ifFalse: [ MalError signal: 'fn* parameters must be symbols: ' , param asReadableString  ].
			param value = '&'
				ifTrue: [ i = (params size - 1)
						ifFalse: [ MalError signal: '& must be in the penultimate position' ].
					variadicSym := params last ] ].
	variadicSym isNotNil
		ifTrue: [ params := params allButLast: 2 ].
	body := args allButFirst.
	^ MalClosure new
		env: ctx env;
		bindings: params;
		variadicSym: variadicSym;
		body: body;
		isMacro: false;
		yourself
]

{ #category : #accessing }
MalFn class >> malName [
	^ 'fn*'
]
