"
A MalReaderTest is a test class for testing the behavior of MalReader
"
Class {
	#name : #MalReaderTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalReaderTest >> testReadAll [
	| parsed expected |
	parsed := MalReader readAll: '1 2'.
	expected := OrderedCollection
		with: (MalInteger withValue: 1)
		with: (MalInteger withValue: 2).
	self assert: parsed equals: expected
]

{ #category : #tests }
MalReaderTest >> testReadAtom [
	| parsed expected stream |
	stream := (OrderedCollection with: '123') readStream.
	parsed := MalReader readAtom: stream.
	expected := MalInteger withValue: 123.
	self assert: parsed equals: expected
]

{ #category : #tests }
MalReaderTest >> testReadAtomFalse [
	| parsed expected stream |
	stream := (OrderedCollection with: 'false') readStream.
	parsed := MalReader readAtom: stream.
	expected := MalBool withValue: false.
	self assert: parsed equals: expected
]

{ #category : #tests }
MalReaderTest >> testReadAtomKeyword [
	| parsed expected stream |
	stream := (OrderedCollection with: ':foo') readStream.
	parsed := MalReader readAtom: stream.
	expected := MalKeyword withValue: ':foo'.
	self assert: parsed equals: expected
]

{ #category : #tests }
MalReaderTest >> testReadAtomNegativeNumber [
	| parsed expected stream |
	stream := (OrderedCollection with: '-123') readStream.
	parsed := MalReader readAtom: stream.
	expected := MalInteger withValue: -123.
	self assert: parsed equals: expected
]

{ #category : #tests }
MalReaderTest >> testReadAtomNil [
	| parsed expected stream |
	stream := (OrderedCollection with: 'nil') readStream.
	parsed := MalReader readAtom: stream.
	expected := MalNil new.
	self assert: parsed equals: expected
]

{ #category : #tests }
MalReaderTest >> testReadAtomString [
	| parsed expected stream |
	stream := (OrderedCollection with: '"foo"') readStream.
	parsed := MalReader readAtom: stream.
	expected := MalString withValue: 'foo'.
	self assert: parsed equals: expected
]

{ #category : #tests }
MalReaderTest >> testReadAtomStringWithEscapes [
	| parsed expected stream |
	stream := (OrderedCollection with: '"foo\\bar\"baz\rbiz"') readStream.
	parsed := MalReader readAtom: stream.
	expected := MalString
		withValue:
			'foo\bar"baz
biz'.
	self assert: parsed equals: expected
]

{ #category : #tests }
MalReaderTest >> testReadAtomSymbol [
	| parsed expected stream |
	stream := (OrderedCollection with: 'abc-def3') readStream.
	parsed := MalReader readAtom: stream.
	expected := MalSymbol withValue: 'abc-def3'.
	self assert: parsed equals: expected
]

{ #category : #tests }
MalReaderTest >> testReadAtomTrue [
	| parsed expected stream |
	stream := (OrderedCollection with: 'true') readStream.
	parsed := MalReader readAtom: stream.
	expected := MalBool withValue: true.
	self assert: parsed equals: expected
]

{ #category : #tests }
MalReaderTest >> testReadString [
	| parsed |
	parsed := MalReader readString: '123'.
	self assert: parsed equals: (MalInteger withValue: 123)
]

{ #category : #tests }
MalReaderTest >> testReadStringHashMap [
	| parsed expectedItems |
	parsed := MalReader readString: '{:foo 1}'.
	self assert: parsed class equals: MalHashMap.
	expectedItems := Dictionary
		with: ((MalKeyword withValue: ':foo') -> (MalInteger withValue: 1)).
	self assert: parsed value equals: expectedItems
]

{ #category : #tests }
MalReaderTest >> testReadStringList [
	| parsed expectedItems |
	parsed := MalReader readString: '(1 2)'.
	self assert: parsed class equals: MalList.
	expectedItems := OrderedCollection with: (MalInteger withValue: 1) with: (MalInteger withValue: 2).
	self assert: parsed value equals: expectedItems
]

{ #category : #tests }
MalReaderTest >> testReadStringUnclosed [
	self should: [ MalReader readString: '(' ] raise: MalSyntaxError
]

{ #category : #tests }
MalReaderTest >> testReadStringUnopened [
"todo: We don't consider foo) to be a syntax error because we only read one form."
	self should: [MalReader readString: ')'] raise: MalSyntaxError.
]

{ #category : #tests }
MalReaderTest >> testReadStringVector [
	| parsed expectedItems |
	parsed := MalReader readString: '[1 2]'.
	self assert: parsed class equals: MalVector.
	expectedItems := OrderedCollection
		with: (MalInteger withValue: 1)
		with: (MalInteger withValue: 2).
	self assert: parsed value equals: expectedItems
]

{ #category : #tests }
MalReaderTest >> testReadStringWithComment [
	| parsed |
	parsed := MalReader readString: ';foo
123'.
	self assert: parsed equals: (MalInteger withValue: 123)
]

{ #category : #tests }
MalReaderTest >> testReadStringWithCommentLineFeed [
	| parsed |
	parsed := MalReader readString: '(do ;' , Character lf asString , ')'.
	self
		assert: parsed
		equals:
			(MalList
				with: (MalSymbol withValue: 'do'))
]

{ #category : #tests }
MalReaderTest >> testReaderMacroDeref [
	| parsed |
	parsed := MalReader readString: '@foo'.
	self
		assert: parsed
		equals:
			(MalList
						with: (MalSymbol withValue: 'deref')
						with: (MalSymbol withValue: 'foo'))
]

{ #category : #tests }
MalReaderTest >> testReaderMacroQuasiquote [
	| parsed expected |
	parsed := MalReader readString: '`~foo'.
	expected := MalReader readString: '(quasiquote (unquote foo))'.
	self
		assert: parsed
		equals:
			expected
]

{ #category : #tests }
MalReaderTest >> testReaderMacroWithMeta [
	| parsed expected |
	parsed := MalReader readString: '(def! foo ^{} (fn* [a] a))'.
	expected := MalReader readString: '(def! foo (with-meta (fn* [a] a) {}))'.
	self
		assert: parsed
		equals:
			expected
]

{ #category : #tests }
MalReaderTest >> testReaderMacroWithMetaInsufficentArgs [
	self should: [ MalReader readString: '^ 123' ] raise: MalError
]
