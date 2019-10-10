"
I'm a base class for built-in function that take exactly one argument.
"
Class {
	#name : #MalFunctionOneArg,
	#superclass : #MalFunction,
	#category : #MakeALisp
}

{ #category : #evaluating }
MalFunctionOneArg >> call: args withContext: env [
	self ensure: args haveArity: 1.
	^ self callArg: args first withContext: env
]

{ #category : #evaluating }
MalFunctionOneArg >> callArg: arg withContext: ctx [
	self subclassResponsibility
]
