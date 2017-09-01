"
A WMalTokenizerTest is a test class for testing the behavior of WMalTokenizer.
"
Class {
	#name : #WMalTokenizerTest,
	#superclass : #TestCase,
	#category : #'WMal-Tests'
}

{ #category : #tests }
WMalTokenizerTest >> testTokenize [
	| instance tokens expected |
	instance := WMalTokenizer withSource: ' foo bar'.
	tokens := instance tokenize.
	expected := OrderedCollection with: 'foo' with: 'bar'.
	self assert: tokens equals: expected
]
