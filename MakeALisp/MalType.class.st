"
I am the base class for all MAL types. Every type wraps an instance variable 'value', 
and knows how to print and evaluate.
"
Class {
	#name : #MalType,
	#superclass : #Object,
	#instVars : [
		'value',
		'meta'
	],
	#category : #MakeALisp
}

{ #category : #initialization }
MalType class >> withValue: aDictionary [
	| instance |
	instance := self new.
	instance value: aDictionary.
	^ instance
]

{ #category : #comparing }
MalType >> = anObject [
   (anObject isKindOf: MalType ) ifFalse: [ ^ false ].
   (self isIterable & anObject isIterable) ifTrue: [^ value = anObject value].
   self class = anObject class ifFalse: [ ^ false ].
   ^ value = anObject value
]

{ #category : #accessing }
MalType >> asReadableString [
	self subclassResponsibility 
]

{ #category : #converting }
MalType >> asString [ 
^ self asReadableString
]

{ #category : #evaluating }
MalType >> call: args withContext: ctx [
	"Try to call this value as a function."

	MalNotCallable signal: 'Not a function: ' , self asReadableString
]

{ #category : #accessing }
MalType >> evalIn: ctx [
	"Default behaviour is that types evaluate to themselves."

	^ self
]

{ #category : #comparing }
MalType >> hash [ 
^ self value hash
]

{ #category : #accessing }
MalType >> isCallable [
	^ false
]

{ #category : #accessing }
MalType >> isIterable [
	^ false
]

{ #category : #accessing }
MalType >> isMacro [
	^ false
]

{ #category : #accessing }
MalType >> isPair [
	^ false
]

{ #category : #accessing }
MalType >> isTruthy [
^ true
]

{ #category : #accessing }
MalType >> macroexpandAllIn: ctx [
	| val previousVal |
	val := self.
	previousVal := nil.
	[ val ~~ previousVal ] whileTrue: [ previousVal := val. val := val macroexpandIn: ctx ].
	^ val
]

{ #category : #accessing }
MalType >> macroexpandIn: ctx [
	^ self
]

{ #category : #accessing }
MalType >> meta [
	^ meta
]

{ #category : #accessing }
MalType >> meta: anObject [
	meta := anObject
]

{ #category : #printing }
MalType >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: '(';
		nextPutAll: value printString ;
		nextPutAll: ')'
]

{ #category : #accessing }
MalType >> value [
^ value
]

{ #category : #accessing }
MalType >> value: aSmalltalkValue [
	value := aSmalltalkValue.
]
