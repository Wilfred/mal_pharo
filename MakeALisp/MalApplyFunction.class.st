"
I represent the apply function.
"
Class {
	#name : #MalApplyFunction,
	#superclass : #MalFunction,
	#category : #MakeALisp
}

{ #category : #accessing }
MalApplyFunction class >> malName [
	^ 'apply'
]

{ #category : #accessing }
MalApplyFunction >> call: args withContext: ctx [
	| func funcArgs |
	args size < 2
		ifTrue: [ MalError signal: 'apply requires at least two arguments' ].
	func := args first.
	func isCallable
		ifFalse: [ MalError signal: 'first argument to apply must be a callable' ].
	funcArgs := OrderedCollection new.
	funcArgs addAll: args allButFirst allButLast.
	args last isIterable ifFalse: [ MalError signal: 'the last argument to apply must be iterable' ].
	funcArgs addAll: args last value.
	^ func call: funcArgs withContext: ctx
]
