"
I represent (fn* ...) expressions in MAL.
"
Class {
	#name : #MalClosure,
	#superclass : #MalCallable,
	#instVars : [
		'env',
		'bindings',
		'variadicSym',
		'body',
		'isMacro'
	],
	#category : #MakeALisp
}

{ #category : #accessing }
MalClosure >> asReadableString [
   isMacro ifTrue: [ ^'#<macro>' ] ifFalse: [  
	^ '#<function>']
]

{ #category : #accessing }
MalClosure >> bindings [
	^ bindings
]

{ #category : #accessing }
MalClosure >> bindings: anObject [
	bindings := anObject
]

{ #category : #accessing }
MalClosure >> body: anObject [
	body := anObject
]

{ #category : #evaluating }
MalClosure >> call: args withContext: callingCtx [
	| bodyEnv result bodyCtx |
	args size < bindings size
		ifTrue: [ MalWrongArity signal: 'not enough arguments to closure' ].
	args size > bindings size & variadicSym isNil
		ifTrue: [ MalWrongArity signal: 'too many arguments to closure' ].
	"Create an environment combining the closure env and the bound symbols."
	bodyEnv := MalEnv withOuter: env.
	bindings withIndexDo: [ :sym :i | bodyEnv at: sym put: (args at: i) ].
	variadicSym isNotNil
		ifTrue: [ bodyEnv
				at: variadicSym
				put: (MalList withValue: (args allButFirst: bindings size)) ].
	bodyCtx := callingCtx withEnv: bodyEnv.

	"Evaluate the body and return the value of the last item."
	result := nil.
	body do: [ :e | result := e evalIn: bodyCtx ].
	^ result
]

{ #category : #accessing }
MalClosure >> env: anEnv [
	env := anEnv
]

{ #category : #accessing }
MalClosure >> isMacro [
	^ isMacro
]

{ #category : #accessing }
MalClosure >> isMacro: anObject [
	^ isMacro := anObject
]

{ #category : #accessing }
MalClosure >> isMacroCall [
	^ isMacro
]

{ #category : #printing }
MalClosure >> printOn: aStream [
	| inner |
	inner := ' ' join: (body collect: #printString).
	aStream
		nextPutAll: 'a MalClosure(';
		nextPutAll: inner;
		nextPutAll: ')'
]

{ #category : #accessing }
MalClosure >> variadicSym [
	^ variadicSym
]

{ #category : #accessing }
MalClosure >> variadicSym: anObject [
	variadicSym := anObject
]
