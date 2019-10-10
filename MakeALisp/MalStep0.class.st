"
I am the simplest Mal REPL, simply echoing my input to the user.
"
Class {
	#name : #MalStep0,
	#superclass : #MalStep,
	#category : #MakeALisp
}

{ #category : #accessing }
MalStep0 class >> commandName [
	^ 'step0_mal'
]

{ #category : #activation }
MalStep0 >> rep: aString [
	^ aString
]
