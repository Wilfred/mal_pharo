"
Testing equality and printing for :keywords.
"
Class {
	#name : #MalKeywordTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalKeywordTest >> testEquality [
	"Ensure = works as expected."

	| k1 k2 |
	k1 := MalKeyword withValue: ':foo'.
	k2 := MalKeyword withValue: ':bar'.
	self assert: k1 = k1.
	self assert: k1 ~= k2
]

{ #category : #tests }
MalKeywordTest >> testPrint [
	"Ensure we can convert to a printable representation."

	| symValue |
	symValue := MalKeyword withValue: ':foo'.
	self assert: symValue asReadableString equals: ':foo'
]
