"
I represent whole numbers in MAL.
"
Class {
	#name : #WMalInteger,
	#superclass : #WMalType,
	#instVars : [
		'value'
	],
	#category : #WMal
}

{ #category : #initialization }
WMalInteger class >> withValue: aNumber [


	| instance |
	instance := self new.
	instance value: aNumber.
	^ instance
]

{ #category : #comparing }
WMalInteger >> = anObject [
	self class = anObject class
		ifTrue: [ ^ value = (anObject value) ]
		ifFalse: [ ^ false ]
]

{ #category : #printing }
WMalInteger >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: '(';
		nextPutAll: value asString;
		nextPutAll: ')'.
]

{ #category : #accessing }
WMalInteger >> value: anInteger [ 
	value := anInteger 
]
