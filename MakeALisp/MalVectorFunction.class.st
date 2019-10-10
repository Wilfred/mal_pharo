"
I represent the vector function.
"
Class {
	#name : #MalVectorFunction,
	#superclass : #MalFunction,
	#category : #MakeALisp
}

{ #category : #accessing }
MalVectorFunction class >> malName [
	^ 'vector'
]

{ #category : #accessing }
MalVectorFunction >> call: args withContext: ctx [
	^ MalVector withValue: args
]
