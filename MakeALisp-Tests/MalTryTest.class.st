"
A MalTryTest is a test class for testing the behavior of MalTry
"
Class {
	#name : #MalTryTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalTryTest >> testCallWithContext [
	| result |
	result := (Mal read: '(try* (throw 1) (catch* exc (+ exc 1)))')
		evalIn: MalContext default.
	self assert: result equals: (MalInteger withValue: 2)
]

{ #category : #tests }
MalTryTest >> testCallWithContextBuiltinError [
	| result |
	result := (Mal
		read: '(try* (no-such-func) (catch* exc (str "error is: " exc)))')
		evalIn: MalContext default.
	self assert: result class equals: MalString
]

{ #category : #tests }
MalTryTest >> testCallWithContextNoCatch [
	| result |
	result := (Mal read: '(try* 1)') evalIn: MalContext default.
	self assert: result equals: (MalInteger withValue: 1)
]
