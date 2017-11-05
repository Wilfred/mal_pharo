"
I am a Make-A-Lisp (MAL) interpreter.
"
Class {
	#name : #WMal,
	#superclass : #Object,
	#category : #WMal
}

{ #category : #'as yet unclassified' }
WMal class >> eval: aForm in: env [
	^ aForm
]

{ #category : #'as yet unclassified' }
WMal class >> evalAst: aForm in: env [
	^ aForm
]

{ #category : #printing }
WMal class >> print: aValue [
	^ aValue print
]

{ #category : #'meta-object-protocol' }
WMal class >> read: aString [
	^ WMalReader readString: aString
]

{ #category : #'as yet unclassified' }
WMal class >> rep: aString in: env [
	^ self print: (self eval: (self read: aString) in: env)
]

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
