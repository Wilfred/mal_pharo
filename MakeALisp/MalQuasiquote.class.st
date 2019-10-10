"
I represent the quasiquote special form in MAL.
"
Class {
	#name : #MalQuasiquote,
	#superclass : #MalSpecialForm,
	#category : #MakeALisp
}

{ #category : #evaluating }
MalQuasiquote class >> call: args withContext: ctx [
	| arg |
	args size = 1
		ifFalse: [ MalWrongArity
				signal: ('quasiquote requires 1 argument (got {1})' format: {args size}) ].
	arg := args first.
	^ (self unquote: arg) evalIn: ctx
]

{ #category : #accessing }
MalQuasiquote class >> malName [
	^ 'quasiquote'
]

{ #category : #evaluating }
MalQuasiquote class >> unquote: ast [
	"Rewrite quasiquoted expr as a series of calls to concat with quoted expressions.
	`foo -> 'foo
	`(x ~@y z) -> (concat 'x value-of-y 'z)"

	| head |
	ast isPair
		ifFalse: [ ^ MalList with: (MalSymbol withValue: 'quote') with: ast ].
	head := ast value first.
	head = (MalSymbol withValue: 'unquote')
		ifTrue: [ ^ ast value second ].
	"((~@foo) x y) -> (concat foo 'x 'y)"
	head isPair
		ifTrue: [ head value first = (MalSymbol withValue: 'splice-unquote')
				ifTrue: [ ^ MalList
						with: (MalSymbol withValue: 'concat')
						with: head value second
						with: (self unquote: ast allButFirst) ] ].
	^ MalList
				with: (MalSymbol withValue: 'cons')
				with: (self unquote: ast value first)
				with: (self unquote: ast allButFirst)
]
