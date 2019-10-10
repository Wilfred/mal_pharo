"
A MalSeqTest is a test class for testing the behavior of MalSeq
"
Class {
	#name : #MalSeqTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalSeqTest >> testCallWithContext [
	| result |
	result := (Mal read: '(seq "ab")') evalIn: MalContext default.
	self assert: result equals: (MalList with: (MalString withValue: 'a') with: (MalString withValue: 'b') )
]

{ #category : #tests }
MalSeqTest >> testCallWithContextEmpty [
	| result |
	result := (Mal read: '(seq "")') evalIn: MalContext default.
	self
		assert: result
		equals:
			(MalNil new)
]
