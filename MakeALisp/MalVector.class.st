"
I represent vectors [ 1 2 3 ] in MAL.
"
Class {
	#name : #MalVector,
	#superclass : #MalType,
	#category : #MakeALisp
}

{ #category : #'as yet unclassified' }
MalVector >> allButFirst [
	^ self class withValue: (self value allButFirst: 1)
]

{ #category : #accessing }
MalVector >> asReadableString [
	| inner |
	inner := ' ' join: (value collect: #asReadableString).
	^ '[' , inner , ']'
]

{ #category : #accessing }
MalVector >> asString [
	| inner |
	inner := ' ' join: (value collect: #asString).
	^ '[' , inner , ']'
]

{ #category : #accessing }
MalVector >> evalIn: ctx [
	"A vector evaluates all its elements."
	^ MalVector
		withValue: (self value collect: [ :item | item evalIn: ctx ])
]

{ #category : #accessing }
MalVector >> initialize [ 
value := OrderedCollection new
]

{ #category : #accessing }
MalVector >> isIterable [
^ true
]

{ #category : #accessing }
MalVector >> isPair [
	^ self value isNotEmpty
]

{ #category : #accessing }
MalVector >> size [
	^ value size
]
