"
I represent the with-meta function.
"
Class {
	#name : #MalWithMeta,
	#superclass : #MalFunction,
	#category : #MakeALisp
}

{ #category : #accessing }
MalWithMeta class >> malName [
	^ 'with-meta'
]

{ #category : #evaluating }
MalWithMeta >> call: args withContext: ctx [
	| newVal |
	self ensure: args haveArity: 2.
	newVal := args first copy.
	newVal meta: args second.
	^ newVal
]
