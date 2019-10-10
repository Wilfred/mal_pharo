"
A MalFirstTest is a test class for testing the behavior of MalFirst
"
Class {
	#name : #MalFirstTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalFirstTest >> testCallWithContext [
	| expr |
	expr := Mal read: '(first (list 1))'.
	self
		assert: (expr evalIn: MalContext default)
		equals: (MalInteger  withValue: 1)
]

{ #category : #tests }
MalFirstTest >> testCallWithContextEmptyList [
	| expr |
	expr := Mal read: '(first (list))'.
	self
		assert: (expr evalIn: MalContext default)
		equals: (MalNil new)
]
