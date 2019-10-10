"
I'm a utility class for reading lines from stdin.
"
Class {
	#name : #MalReadLine,
	#superclass : #Object,
	#category : #MakeALisp
}

{ #category : #'user interaction' }
MalReadLine class >> read: stdout withPrompt: prompt [
	stdout << prompt.
	^ (Stdio stdin upTo: Character lf asInteger) asString
]
