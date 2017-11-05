"
A WMalTest is a test class for testing the behavior of WMal
"
Class {
	#name : #WMalTest,
	#superclass : #TestCase,
	#category : #'WMal-Tests'
}

{ #category : #tests }
WMalTest >> testEvalAstSymbol [
	| foo |
	self should: [ WMal evalAst: foo in: nil ] raise: WMalUnboundSymbol
]

{ #category : #tests }
WMalTest >> testFoo [
^ nil
]
