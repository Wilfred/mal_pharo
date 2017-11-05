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
	| parsed expected stream |
	stream := (OrderedCollection with: '123') readStream.
	parsed := WMalReader readAtom: stream.
	expected := WMalInteger withValue: 123.
	self assert: parsed equals: expected
]

{ #category : #tests }
WMalReaderTest >> testReadAtomFalse [
	| parsed expected stream |
	stream := (OrderedCollection with: 'false') readStream.
	parsed := WMalReader readAtom: stream.
	expected := WMalBool withValue: false.
	self assert: parsed equals: expected
]

{ #category : #tests }
WMalReaderTest >> testReadAtomNil [
	| parsed expected stream |
	stream := (OrderedCollection with: 'nil') readStream.
	parsed := WMalReader readAtom: stream.
	expected := WMalNil new.
	self assert: parsed equals: expected
]

{ #category : #tests }
WMalReaderTest >> testReadAtomSymbol [
	| parsed expected stream |
	stream := (OrderedCollection with: 'abc') readStream.
	parsed := WMalReader readAtom: stream.
	expected := WMalSymbol withValue: 'abc'.
	self assert: parsed equals: expected
]

{ #category : #tests }
WMalReaderTest >> testReadAtomTrue [
	| parsed expected stream |
	stream := (OrderedCollection with: 'true') readStream.
	parsed := WMalReader readAtom: stream.
	expected := WMalBool withValue: true.
	self assert: parsed equals: expected
]

{ #category : #tests }
WMalReaderTest >> testReadForm [
	| parsed expectedItems |
	parsed := WMalReader readString: '(1 2)'.
	self assert: parsed class equals: WMalList.
	expectedItems := OrderedCollection with: (WMalInteger withValue: 1) with: (WMalInteger withValue: 2).
	self assert: parsed value equals: expectedItems
]

{ #category : #tests }
WMalReaderTest >> testReadString [
	| parsed |
	parsed := WMalReader readString: '123'.
	self assert: parsed equals: (WMalInteger withValue: 123)
]

{ #category : #tests }
WMalReaderTest >> testReadStringUnclosed [
	self should: [ WMalReader readString: '(' ] raise: WMalSyntaxError
]

{ #category : #tests }
WMalReaderTest >> testReadStringUnopened [
"todo: We don't consider foo) to be a syntax error because we only read one form."
	self should: [WMalReader readString: ')'] raise: WMalSyntaxError.
]
