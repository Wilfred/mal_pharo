"
A MalSwapTest is a test class for testing the behavior of MalSwap
"
Class {
	#name : #MalSwapTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalSwapTest >> testCallWithContext [
	| result expr |
	expr := Mal read: '(do (def! n (atom 1)) (swap! n + 2 3) @n)'.
	result := expr evalIn: MalContext default.
	self assert: result equals: (MalInteger withValue: 6)
]
