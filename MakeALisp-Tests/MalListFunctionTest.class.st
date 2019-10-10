"
A MalListFunctionTest is a test class for testing the behavior of MalListFunction
"
Class {
	#name : #MalListFunctionTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalListFunctionTest >> testCallWithContext [
	| args |
	args := OrderedCollection
		with: (MalInteger withValue: 2)
		with: (MalInteger withValue: 3).
	self
		assert: (MalListFunction new call: args withContext: nil)
		equals: (MalList withValue: args)
]
