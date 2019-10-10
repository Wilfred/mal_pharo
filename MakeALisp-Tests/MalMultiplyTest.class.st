"
A MalMultiplyTest is a test class for testing the behavior of MalMultiply
"
Class {
	#name : #MalMultiplyTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalMultiplyTest >> testCallWithContext [
	| args |
	args := OrderedCollection
		with: (MalInteger withValue: 2)
		with: (MalInteger withValue: 3).
	self
		assert: (MalMultiply new call: args withContext: nil)
		equals: (MalInteger withValue: 6)
]
