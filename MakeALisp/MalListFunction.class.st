"
I represent the list function in MAL.
"
Class {
	#name : #MalListFunction,
	#superclass : #MalFunction,
	#category : #MakeALisp
}

{ #category : #accessing }
MalListFunction class >> malName [
^ 'list'
]

{ #category : #accessing }
MalListFunction >> call: args withContext: ctx [
	^ MalList withValue: args
]
