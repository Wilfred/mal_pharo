"
A MalAddTest is a test class for testing the behavior of MalAdd
"
Class {
	#name : #MalAddTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalAddTest >> testCallWithContext [
	| result |
	result := (Mal read: '(+ 0 1 1)') evalIn: MalContext default.
	self assert: result equals: (MalInteger withValue: 2)
]

{ #category : #tests }
MalAddTest >> testCallWithContextTypeError [
	| expr |
	expr := Mal read: '(+ 42 true)'.
	self should: [ expr evalIn: MalContext default ] raise: MalError
]
