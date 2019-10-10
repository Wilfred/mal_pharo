"
A WMalTokenizerTest is a test class for testing the behavior of WMalTokenizer.
"
Class {
	#name : #MalTokenizerTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalTokenizerTest >> testFromString [
	| tokens expected |
	tokens := MalTokenizer fromString: ' foo bar'.
	expected := OrderedCollection with: 'foo' with: 'bar'.
	self assert: tokens equals: expected
]

{ #category : #tests }
MalTokenizerTest >> testFromStringCommas [
	| tokens expected |
	tokens := MalTokenizer fromString: ' ,,foo ,'.
	expected := OrderedCollection with: 'foo'.
	self assert: tokens equals: expected
]

{ #category : #tests }
MalTokenizerTest >> testFromStringHashMap [
	| tokens expected |
	tokens := MalTokenizer fromString: '{:foo 1}'.
	expected := OrderedCollection
		with: '{'
		with: ':foo'
		with: '1'
		with: '}'.
	self assert: tokens equals: expected
]

{ #category : #tests }
MalTokenizerTest >> testFromStringNewline [
	| tokens expected |
	tokens := MalTokenizer fromString: 'foo
bar'.
	expected := OrderedCollection with: 'foo' with: 'bar'.
	self assert: tokens equals: expected
]

{ #category : #tests }
MalTokenizerTest >> testFromStringVector [
	| tokens expected |
	tokens := MalTokenizer fromString: '[1]'.
	expected := OrderedCollection with: '['
		with: '1'
		with: ']'.
	self assert: tokens equals: expected
]

{ #category : #tests }
MalTokenizerTest >> testFromStringWithComment [
	| tokens expected |
	tokens := MalTokenizer
		fromString:
			'; a comment
			foo ; another comment
bar
; more comment'.
	expected := OrderedCollection with: 'foo' with: 'bar'.
	self assert: tokens equals: expected
]
