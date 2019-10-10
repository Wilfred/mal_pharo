"
A WMalIntegerTest is a test class for testing the behavior of WMalInteger
"
Class {
	#name : #MalIntegerTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalIntegerTest >> testEquality [
	"Ensure = works as expected."

	| int1a int1b int2 |
	int1a := MalInteger withValue: 1.
	int1b := MalInteger withValue: 1.
	int2 := MalInteger withValue: 2.
	self assert: int1a = int1b.
	self assert: int1a ~= int2
]

{ #category : #tests }
MalIntegerTest >> testPrint [
	"Ensure we can convert to a printable representation."

	| int |
	int := MalInteger withValue: 123.
	self assert: int asReadableString equals: '123'
]
