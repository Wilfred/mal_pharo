"
A MalBoolAtomTest is a test class for testing the behavior of MalBoolAtom
"
Class {
	#name : #MalBoolAtomTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalBoolAtomTest >> testMatches [
self assert: (MalBoolLiteral matches: 'true') equals: true
]

{ #category : #tests }
MalBoolAtomTest >> testMatchesFalse [
	self assert: (MalBoolLiteral matches: 'false') equals: true
]
