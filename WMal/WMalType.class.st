"
I am the base class for all MAL types.
"
Class {
	#name : #WMalType,
	#superclass : #Object,
	#instVars : [
		'value'
	],
	#category : #WMal
}

{ #category : #initialization }
WMalType class >> withValue: aNumber [


	| instance |
	instance := self new.
	instance value: aNumber.
	^ instance
]

{ #category : #comparing }
WMalType >> = anObject [
	self class = anObject class
		ifTrue: [ ^ value = (anObject value) ]
		ifFalse: [ ^ false ]
]

{ #category : #accessing }
WMalType >> call: args [
"Try to call this value as a function."
	WMalNotCallable signal: 'Not a function: ' , self print
]

{ #category : #accessing }
WMalType >> evalIn: env [ 
	^ self
]

{ #category : #accessing }
WMalType >> print [
	self subclassResponsibility 
]

{ #category : #printing }
WMalType >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: '(';
		nextPutAll: value printString ;
		nextPutAll: ')'
]

{ #category : #accessing }
WMalType >> value [
^ value
]

{ #category : #accessing }
WMalType >> value: anInteger [
	value := anInteger.
	^self
]
