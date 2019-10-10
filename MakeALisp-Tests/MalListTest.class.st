"
Testing methods on MalList.
"
Class {
	#name : #MalListTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalListTest >> testEval [
	"Evaluate a list."

	| val env ctx |
	val := Mal read: '(+ 1 (+ 2 3))'.
	env := Dictionary new
		at: '+' put: MalAdd new;
		yourself.
	ctx := MalContext new
		env: env;
		yourself.
	self assert: (val evalIn: ctx) equals: (MalInteger withValue: 6)
]

{ #category : #tests }
MalListTest >> testEvalEmpty [
	"Empty list should evaluate to itself."

	| val |
	val := Mal read: '()'.
	self assert: (val evalIn: nil) equals: val
]

{ #category : #tests }
MalListTest >> testEvalMacro [
	| expr ctx |
	expr := Mal read: '(do (defmacro! foo (fn* () `(if true 1 2))) (foo))'.
	ctx := MalContext default.
	self assert: (expr evalIn: ctx) equals: (MalInteger withValue: 1)
]

{ #category : #tests }
MalListTest >> testEvalMacroThatReturnsAtom [
	| expr ctx |
	expr := Mal
		read: '(do (defmacro! one (fn* () 1)) (one))'.
	ctx := MalContext default.
	self assert: (expr evalIn: ctx) equals: (MalInteger withValue: 1)
]

{ #category : #tests }
MalListTest >> testPrint [
	| val |
	val := MalList
		with: (MalInteger withValue: 1)
		with: (MalInteger withValue: 2).
	self assert: val asReadableString equals: '(1 2)'
]
