"
A MalCountTest is a test class for testing the behavior of MalCount
"
Class {
	#name : #MalCountTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalCountTest >> testCallWithContext [
	| args |
	args := OrderedCollection
		with: (MalList with: MalNil new).
	self
		assert: (MalCount new call: args withContext: nil)
		equals: (MalInteger withValue: 1)
]
