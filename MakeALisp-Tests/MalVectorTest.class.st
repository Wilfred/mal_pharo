"
Testing printing and evaluating of vectors.
"
Class {
	#name : #MalVectorTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalVectorTest >> testEval [
	"Evaluate a vector and ensure elements are evaluated."

	| val expected |
	val := Mal read: '[1 (+ 2 3)]'.
	expected := Mal read: '[1 5]'.
	self assert: (val evalIn: MalContext default) equals: expected
]

{ #category : #tests }
MalVectorTest >> testEvalEmpty [
	"Empty vector should evaluate to itself."

	| val |
	val := MalVector new.
	self assert: (val evalIn: nil) equals: val
]

{ #category : #tests }
MalVectorTest >> testPrint [
	| val first second items |
	first := MalInteger withValue: 1.
	second := MalInteger withValue: 2.
	items := OrderedCollection with: first with: second.
	val := MalVector withValue: items.
	self assert: val asReadableString equals: '[1 2]'
]
