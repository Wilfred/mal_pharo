Class {
	#name : #WMalNilTest,
	#superclass : #TestCase,
	#category : #'WMal-Tests'
}

{ #category : #tests }
WMalNilTest >> testEvalIn [
	| nilValue |
	nilValue := WMalNil new.
	self assert: (nilValue evalIn: nil) equals: nilValue
]

{ #category : #tests }
WMalNilTest >> testPrint [
	"Ensure we can convert to a printable representation."

	| nilValue |
	nilValue := WMalNil new.
	self assert: nilValue print equals: 'nil'
]
