"
A MalDerefTest is a test class for testing the behavior of MalDeref
"
Class {
	#name : #MalDerefTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalDerefTest >> testCallWithContext [
	| result expr |
	expr := Mal read: '(do (def! e (atom {"+" +})) ((get @e "+") 7 8))'.
	result := expr evalIn: MalContext default.
	self assert: result equals: (MalInteger withValue: 15)
]
