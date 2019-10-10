"
A MalKeywordFunctionTest is a test class for testing the behavior of MalKeywordFunction
"
Class {
	#name : #MalKeywordFunctionTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalKeywordFunctionTest >> testCallWithContext [
	| ctx expr |
	expr := Mal read: '(keyword "foo")'.
	ctx := MalContext default.
	self assert: (expr evalIn: ctx) equals: (MalKeyword withValue: ':foo')
]
