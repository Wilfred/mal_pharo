"
I represent built-in functions in MAL.

If a child implements the malName method, it will be included in the default environment.
"
Class {
	#name : #MalFunction,
	#superclass : #MalCallable,
	#category : #MakeALisp
}

{ #category : #accessing }
MalFunction class >> malName [
^ nil
]

{ #category : #accessing }
MalFunction >> asReadableString [
	^ '#<built-in function>'
]

{ #category : #evaluating }
MalFunction >> call: args withContext: ctx [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
MalFunction >> ensure: arg hasType: aClass [
	arg class = aClass
		ifFalse: [ MalError
				signal:
					('{1} requires an argument of type {2}'
						format:
							{self class malName.
							aClass name asString}) ]
]

{ #category : #evaluating }
MalFunction >> ensure: args haveArity: arity [
	| msg |
	msg := 'The function {1} takes {2} argument{3} (got {4})'
		format:
			{self class malName.
			arity.
			(arity = 1
				ifTrue: [ '' ]
				ifFalse: [ 's' ]). args size}.
	args size = arity
		ifFalse: [ MalWrongArity signal: msg ]
]

{ #category : #'as yet unclassified' }
MalFunction >> ensure: args haveMinArity: arity [
	| msg |
	msg := 'The function {1} requires at least {2} argument{3} (got {4})'
		format:
			{self class malName.
			arity.
			(arity = 1
				ifTrue: [ '' ]
				ifFalse: [ 's' ]).
			args size}.
	args size < arity
		ifTrue: [ MalWrongArity signal: msg ]
]

{ #category : #'as yet unclassified' }
MalFunction >> ensure: args haveType: aClass [
	args
		do: [ :arg | 
			self ensure: arg hasType: aClass ]
]
