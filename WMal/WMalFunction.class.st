"
I represent callable values in MAL. Currently just built-in functions.
"
Class {
	#name : #WMalFunction,
	#superclass : #WMalType,
	#category : #WMal
}

{ #category : #accessing }
WMalFunction >> call: args [
	self subclassResponsibility 
]
