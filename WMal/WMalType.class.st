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

{ #category : #comparing }
WMalType >> = anObject [
	self class = anObject class
		ifTrue: [ ^ value = (anObject value) ]
		ifFalse: [ ^ false ]
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
