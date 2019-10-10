"
Testing symbols, both bound and unbound.
"
Class {
	#name : #MalSymbolTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalSymbolTest >> testEvalIn [
	"Test that we lookup values in the environment."

	| fooSym env one ctx |
	fooSym := MalSymbol withValue: 'foo'.
	one := MalInteger withValue: 1.
	env := Dictionary new
		at: 'foo' put: one;
		yourself.
	ctx := MalContext new env: env; yourself.
	self assert: (fooSym evalIn: ctx) equals: one
]

{ #category : #tests }
MalSymbolTest >> testEvalInUnbound [
	"Test that we error on unbound symbols."

	| fooSym ctx |
	fooSym := MalSymbol withValue: 'foo'.
	ctx := MalContext new env: (Dictionary new); yourself.
	self should: [ fooSym evalIn: ctx ] raise: MalUnboundSymbol
]

{ #category : #tests }
MalSymbolTest >> testPrint [
	"Ensure we can convert to a printable representation."

	| symValue |
	symValue := MalSymbol withValue: 'foo'.
	self assert: symValue asReadableString equals: 'foo'
]
