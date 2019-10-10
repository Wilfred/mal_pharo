"
A WMalEnvTest is a test class for testing the behavior of WMalEnv.
"
Class {
	#name : #MalEnvTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #'tests-setter' }
MalEnvTest >> testAtPut [
	| dict sym |
	dict := MalEnv new.
	sym := MalSymbol withValue: 'foo'.
	dict at: sym put: 123.
	self assert: (dict at: sym) equals: 123
]
