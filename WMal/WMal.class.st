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

{ #category : #'as yet unclassified' }
WMal >> print: aValue [
	^aValue
]

{ #category : #'as yet unclassified' }
WMal >> read: aString [ 
	^aString.
]

{ #category : #'as yet unclassified' }
WMal >> rep: aString [
	^self print: (self eval: (self read: aString)).
]
