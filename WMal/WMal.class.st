"
I am a Make-A-Lisp (MAL) interpreter.
"
Class {
	#name : #WMal,
	#superclass : #Object,
	#category : #WMal
}

{ #category : #'as yet unclassified' }
WMal >> eval: aForm [ 
	^aForm
]

{ #category : #printing }
WMal >> print: aValue [
	^ aValue print
]

{ #category : #'meta-object-protocol' }
WMal >> read: aString [
	^ WMalReader readString: aString
]

{ #category : #'as yet unclassified' }
WMal >> rep: aString [
	^self print: (self eval: (self read: aString)).
]
