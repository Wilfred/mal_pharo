"
A MalConjTest is a test class for testing the behavior of MalConj
"
Class {
	#name : #MalConjTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalConjTest >> testCallWithContext [
	| result expected |
	result := (Mal read: '(conj [1] 2)') evalIn: MalContext default.
	expected := MalVector
		withValue:
			(OrderedCollection
				with: (MalInteger withValue: 1)
				with: (MalInteger withValue: 2)).
	self assert: result class equals: MalVector.
	self assert: result equals: expected
]

{ #category : #tests }
MalConjTest >> testCallWithContextList [
	| result expected |
	result := (Mal read: '(conj (list 1) 2)') evalIn: MalContext default.
	expected := MalList
		with: (MalInteger withValue: 2)
		with: (MalInteger withValue: 1).
	self assert: result equals: expected
]
