"
A MalApplyFunctionTest is a test class for testing the behavior of MalApplyFunction
"
Class {
	#name : #MalApplyFunctionTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalApplyFunctionTest >> testCallWithCtx [
	| ctx expr |
	expr := Mal read: '(apply + 1 2 (list 3 4))'.
	ctx := MalContext default.
	self assert: (expr evalIn: ctx) equals: (MalInteger withValue: 10)
]
