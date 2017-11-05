Class {
	#name : #WMalSymbolTest,
	#superclass : #TestCase,
	#category : #'WMal-Tests'
}

{ #category : #tests }
WMalSymbolTest >> testEvalIn [
	"Test that we lookup values in the environment."

	| fooSym env one |
	fooSym := WMalSymbol withValue: 'foo'.
	one := WMalInteger withValue: 1.
	env := Dictionary new
		at: 'foo' put: one;
		yourself.
	self assert: (fooSym evalIn: env) equals: one
]

{ #category : #tests }
WMalSymbolTest >> testEvalInUnbound [
	"Test that we error on unbound symbols."

	| fooSym env |
	fooSym := WMalSymbol withValue: 'foo'.
	env := Dictionary new.
	self should: [ fooSym evalIn: env ] raise: WMalUnboundSymbol 

]

{ #category : #tests }
WMalSymbolTest >> testPrint [
	"Ensure we can convert to a printable representation."

	| symValue |
	symValue := WMalSymbol withValue: 'foo'.
	self assert: symValue print equals: 'foo'
]
