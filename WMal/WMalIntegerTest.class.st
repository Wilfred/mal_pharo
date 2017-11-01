"
A WMalIntegerTest is a test class for testing the behavior of WMalInteger
"
Class {
	#name : #WMalIntegerTest,
	#superclass : #TestCase,
	#category : #'WMal-Tests'
}

{ #category : #tests }
WMalIntegerTest >> testEquality [
	"Ensure = works as expected."

	| int1a int1b int2 |
	int1a := WMalInteger withValue: 1.
	int1b := WMalInteger withValue: 1.
	int2 := WMalInteger withValue: 2.
	self assert: int1a = int1b.
	self assert: int1a ~= int2
]

{ #category : #tests }
WMalIntegerTest >> testPrint [
	"Ensure we can convert to a printable representation."

	| int |
	int := WMalInteger withValue: 123.
	self assert: int print equals: '123'
]
