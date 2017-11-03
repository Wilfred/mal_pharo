Class {
	#name : #WMalSymbolTest,
	#superclass : #TestCase,
	#category : #'WMal-Tests'
}

{ #category : #tests }
WMalSymbolTest >> testPrint [
	"Ensure we can convert to a printable representation."

	| symValue |
	symValue := WMalSymbol withValue: 'foo'.
	self assert: symValue print equals: 'foo'
]
