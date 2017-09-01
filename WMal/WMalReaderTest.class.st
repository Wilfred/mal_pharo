"
A WMalReaderTest is a test class for testing the behavior of WMalReader
"
Class {
	#name : #WMalReaderTest,
	#superclass : #TestCase,
	#category : #'WMal-Tests'
}

{ #category : #tests }
WMalReaderTest >> testReadAtom [
	| parsed expected |
	parsed := WMalReader readAtom: '123'.
	expected := WMalInteger withValue: 123.
	self assert: parsed equals: expected
]

{ #category : #tests }
WMalReaderTest >> testReadString [
	| parsed |
	parsed := WMalReader readString: '123'.
	self assert: parsed size equals: 1
]
