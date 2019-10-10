"
A MalFnPredicateTest is a test class for testing the behavior of MalFnPredicate
"
Class {
	#name : #MalFnPredicateTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalFnPredicateTest >> testCallWithContext [
	| result expr |
	expr := Mal read: '(fn? +)'.
	result := expr evalIn: MalContext default.
	self assert: result equals: (MalBool withValue: true)
]

{ #category : #tests }
MalFnPredicateTest >> testCallWithContextMacro [
	| result expr |
	expr := Mal read: '(fn? cond)'.
	result := expr evalIn: MalContext default.
	self assert: result equals: (MalBool withValue: false)
]
