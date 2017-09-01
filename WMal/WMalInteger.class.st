"
I represent whole numbers in MAL.
"
Class {
	#name : #WMalInteger,
	#superclass : #WMalType,
	#category : #WMal
}

{ #category : #initialization }
WMalInteger class >> withValue: aNumber [


	| instance |
	instance := self new.
	instance value: aNumber.
	^ instance
]
