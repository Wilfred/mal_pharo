"
A MalStrTest is a test class for testing the behavior of MalStr
"
Class {
	#name : #MalStrTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalStrTest >> testCallWithContext [
	| ctx expr |
	expr := Mal read: '(str {:foo "bar"})'.
	ctx := MalContext default.
	self
		assert: (expr evalIn: ctx)
		equals:
			(MalString
				withValue: '{:foo bar}')
]
