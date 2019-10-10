"
A MalReadStringTest is a test class for testing the behavior of MalReadString
"
Class {
	#name : #MalReadStringTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #test }
MalReadStringTest >> testCallArgWithContext [
	| expr expected |
	expr := Mal read: '(read-string "(1 foo)")'.
	expected := MalList
				with: (MalInteger withValue: 1)
				with: (MalSymbol withValue: 'foo').
	self assert: (expr evalIn: MalContext default) equals: expected
]
