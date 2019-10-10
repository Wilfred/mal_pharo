"
Test evaluation and print for nil.
"
Class {
	#name : #MalNilTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalNilTest >> testEvalIn [
	| nilValue |
	nilValue := MalNil new.
	self assert: (nilValue evalIn: nil) equals: nilValue
]

{ #category : #tests }
MalNilTest >> testPrint [
	"Ensure we can convert to a printable representation."

	| nilValue |
	nilValue := MalNil new.
	self assert: nilValue asReadableString equals: 'nil'
]
