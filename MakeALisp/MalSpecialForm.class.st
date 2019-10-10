"
I represent special forms in MAL.

Special forms choose whether to evaluate their arguments, and cannot be shadowed by variables.
"
Class {
	#name : #MalSpecialForm,
	#superclass : #Object,
	#instVars : [
		'value'
	],
	#category : #MakeALisp
}

{ #category : #evaluating }
MalSpecialForm class >> call: args withContext: ctx [
	self subclassResponsibility
]

{ #category : #accessing }
MalSpecialForm class >> malName [
self subclassResponsibility 
]

{ #category : #accessing }
MalSpecialForm class >> matchesSymbol: aSymbol [
	self
		subclassesDo: [ :f | 
			f malName = aSymbol value
				ifTrue: [ ^ f ] ].
	^ nil
]
