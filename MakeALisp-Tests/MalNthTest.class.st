"
A MalNthTest is a test class for testing the behavior of MalNth
"
Class {
	#name : #MalNthTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalNthTest >> testCallWithContext [
	| expr |
	expr := Mal read: '(nth (list 10 11 12) 1)'.
	self
		assert: (expr evalIn: MalContext default)
		equals: (MalInteger withValue: 11)
]

{ #category : #tests }
MalNthTest >> testCallWithContextOutOfBounds [
	| expr |
	expr := Mal read: '(nth (list 10 11 12) 42)'.
	self should: [expr evalIn: MalContext default] raise: MalError
]
