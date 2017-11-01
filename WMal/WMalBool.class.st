"
I represent boolean values (true and false) in MAL.
"
Class {
	#name : #WMalBool,
	#superclass : #WMalType,
	#category : #WMal
}

{ #category : #accessing }
WMalBool >> print [
	^ self value asString
]
