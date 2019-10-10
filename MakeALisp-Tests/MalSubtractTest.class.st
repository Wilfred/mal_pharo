"
A MalSubtractTest is a test class for testing the behavior of MalSubtract
"
Class {
	#name : #MalSubtractTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalSubtractTest >> testCallWithContext [
	| sexp |
	sexp := Mal read: '(- 3 2)'.
	self
		assert: (sexp evalIn: MalContext default)
		equals: (MalInteger withValue: 1)
]
