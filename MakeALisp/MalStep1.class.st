"
I am a simple Mal REPL, parsing then printing my input.
"
Class {
	#name : #MalStep1,
	#superclass : #MalStep,
	#category : #MakeALisp
}

{ #category : #accessing }
MalStep1 class >> commandName [
	^ 'step1_mal'
]

{ #category : #activation }
MalStep1 >> rep: aString [
	^ [Mal print: (Mal read: aString)] on: MalError do: [ :ex | ex messageText  ]
]
