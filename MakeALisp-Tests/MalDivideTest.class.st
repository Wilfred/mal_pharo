"
A WMalDivideTest is a test class for testing the behavior of WMalDivide
"
Class {
	#name : #MalDivideTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #'tests-accessing' }
MalDivideTest >> testCallWithContext [
	| args |
	args := OrderedCollection
		with: (MalInteger withValue: 11)
		with: (MalInteger withValue: 5).
	self
		assert: (MalDivide new call: args withContext: nil)
		equals: (MalInteger withValue: 2)
]

{ #category : #'tests-accessing' }
MalDivideTest >> testCallWithContextNotEnoughArgs [
	| args |
	args := OrderedCollection new.
	self
		should: [ MalDivide new call: args withContext: nil ]
		raise: MalWrongArity 
]
