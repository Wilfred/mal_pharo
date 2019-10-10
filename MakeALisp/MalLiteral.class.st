"
I represent atoms in MAL. My subclasses can convert lexemes (a string) to a MAL value.
"
Class {
	#name : #MalLiteral,
	#superclass : #Object,
	#category : #MakeALisp
}

{ #category : #testing }
MalLiteral class >> fromToken: token [
	self subclassResponsibility
]

{ #category : #testing }
MalLiteral class >> matches: aString [
self subclassResponsibility 
]
