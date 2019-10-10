"
A MalEqualTest is a test class for testing the behavior of MalEqual
"
Class {
	#name : #MalEqualTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #test }
MalEqualTest >> testCallWithContext [
	| expr |
	expr := Mal read: '(= 1 2)'.
	self
		assert: (expr evalIn: MalContext default)
		equals: (MalBool withValue: false)
]

{ #category : #test }
MalEqualTest >> testCallWithContextVector [
	| expr |
	expr := Mal read: '(= 1 2)'.
	self
		assert: (expr evalIn: MalContext default)
		equals: (MalBool withValue: false)
]

{ #category : #test }
MalEqualTest >> testCallWithContextVectorAndList [
	| expr |
	expr := Mal read: '(= [] (list))'.
	self
		assert: (expr evalIn: MalContext default)
		equals: (MalBool withValue: true)
]
