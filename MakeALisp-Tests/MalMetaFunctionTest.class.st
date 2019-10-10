"
A MalMetaFunctionTest is a test class for testing the behavior of MalMetaFunction
"
Class {
	#name : #MalMetaFunctionTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalMetaFunctionTest >> testCallWithContext [
	| result |
	result := (Mal read: '(meta [1 2 3])') evalIn: MalContext default.
	self assert: result equals: (MalNil new)
]
