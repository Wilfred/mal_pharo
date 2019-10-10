"
Testing evaluation of quasiquotation.
"
Class {
	#name : #MalQuasiquoteTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalQuasiquoteTest >> testQuasiquoteAtom [
	| result |
	result := (Mal read: '`42')
		evalIn: MalContext default.
	self assert: result equals: (MalInteger withValue: 42)
]

{ #category : #tests }
MalQuasiquoteTest >> testQuasiquoteList [
	| result expected |
	result := (Mal read: '(quasiquote (1 2 3))')
		evalIn: MalContext default.
	expected := Mal read: '(1 2 3)'.
	self assert: result equals: expected
]

{ #category : #tests }
MalQuasiquoteTest >> testQuasiquoteUnsplice [
	| result expected |
	result := (Mal read: '(do (def! x ''(10 11)) `(1 ~@x 2))')
		evalIn: MalContext default.
	expected := Mal read: '(1 10 11 2)'.
	self assert: result equals: expected
]

{ #category : #tests }
MalQuasiquoteTest >> testQuasiquoteVector [
	| result expected |
	result := (Mal read: '`[1 foo]')
		evalIn: MalContext default.
	expected := Mal read: '(1 foo)'.
	self assert: result equals: expected
]
