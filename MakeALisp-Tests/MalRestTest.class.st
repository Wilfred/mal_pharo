"
A MalRestTest is a test class for testing the behavior of MalRest
"
Class {
	#name : #MalRestTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalRestTest >> testCallWithContext [
	| expr expected |
	expr := Mal read: '(rest (list 1 2))'.
	expected := Mal read: '(2)'.
	self assert: (expr evalIn: MalContext default) equals: expected
]

{ #category : #tests }
MalRestTest >> testCallWithContextNil [
	| expr |
	expr := Mal read: '(rest nil)'.
	self assert: (expr evalIn: MalContext default) class equals: MalList
]

{ #category : #tests }
MalRestTest >> testCallWithContextVector [
	| expr expected result |
	expr := Mal read: '(rest [1 2])'.
	expected := Mal read: '(2)'.
	result := (expr evalIn: MalContext default).
	self assert: result equals: expected.
	self assert: result class equals: MalList
]
