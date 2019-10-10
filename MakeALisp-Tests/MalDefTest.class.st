"
A MalDefTest is a test class for testing the behavior of MalDef
"
Class {
	#name : #MalDefTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalDefTest >> testDefInClosure [
	"Ensure def! still applies to the outer env."

	| result |
	result := (Mal read: '(do ((fn* () (def! x 1))) x)') evalIn: MalContext default.
	self assert: result equals: (MalInteger withValue: 1)
]
