"
A WMalTest is a test class for testing the behavior of WMal
"
Class {
	#name : #MalTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalTest >> assertReadEval: src equals: expected [
	| expr |
	expr := Mal read: src.
	self assert: (expr evalIn: MalContext default) equals: expected
]

{ #category : #tests }
MalTest >> testDef [
	| defExpr ctx |
	defExpr := Mal read: '(def! x 42)'.
	ctx := MalContext default.
	defExpr evalIn: ctx.
	self
		assert: ((MalSymbol withValue: 'x') evalIn: ctx)
		equals: (MalInteger withValue: 42)
]

{ #category : #tests }
MalTest >> testDo [
	self
		assertReadEval: '(do (def! x 1) x)'
		equals: (MalInteger withValue: 1)
]

{ #category : #tests }
MalTest >> testEvalIn [
	| val ctx |
	val := Mal read: '(+ (* 2 3) 1)'.
	ctx := MalContext default.
	self assert: (val evalIn: ctx) equals: (MalInteger withValue: 7)
]

{ #category : #tests }
MalTest >> testFn [
	| expr |
	expr := Mal read: '(fn* (x) 1)'.
	self
		assert: (expr evalIn: MalContext default) class
		equals: MalClosure
]

{ #category : #tests }
MalTest >> testFnBadParams [
	| expr |
	expr := Mal read: '(fn* (x 1 "foo") 1)'.
	self should: [ expr evalIn: MalContext default ] raise: MalError
]

{ #category : #tests }
MalTest >> testFnBadParamsVariadic [
	| expr |
	expr := Mal read: '(fn* (x & foo bar) 1)'.
	self should: [ expr evalIn: MalContext default ] raise: MalError
]

{ #category : #tests }
MalTest >> testFnBadParamsVariadicTwice [
	| expr |
	expr := Mal read: '(fn* (x & &) 1)'.
	self should: [ expr evalIn: MalContext default ] raise: MalError
]

{ #category : #tests }
MalTest >> testFnCall [
	self
		assertReadEval: '((fn* (x) (+ x 1)) 2)'
		equals: (MalInteger withValue: 3)
]

{ #category : #tests }
MalTest >> testFnVariadic [
	| expr result |
	expr := Mal read: '(fn* (x y & rest) rest)'.
	result := expr evalIn: MalContext default.
	self assert: result variadicSym equals: (MalSymbol withValue: 'rest').
	self
		assert: result bindings
		equals:
			(OrderedCollection
				with: (MalSymbol withValue: 'x')
				with: (MalSymbol withValue: 'y'))
]

{ #category : #tests }
MalTest >> testFnVariadicCall [
	| expr two three |
	expr := Mal read: '((fn* (x & args) args) 1 2 3)'.
	two := MalInteger withValue: 2.
	three := MalInteger withValue: 3.
	self
		assert: (expr evalIn: MalContext default)
		equals: (MalList with: two with: three)
]

{ #category : #tests }
MalTest >> testIfFalse [
	| ctx expr |
	expr := Mal read: '(if false (no-such-fun) 1)'.
	ctx := MalContext default.
	self assert: (expr evalIn: ctx) equals: (MalInteger withValue: 1)
]

{ #category : #tests }
MalTest >> testIfNil [
	self assertReadEval: '(if nil (no-such-fun) 1)' equals: (MalInteger withValue: 1)
]

{ #category : #tests }
MalTest >> testIfOneArg [

	self assertReadEval: '(if true 1)' equals: (MalInteger withValue: 1)
]

{ #category : #tests }
MalTest >> testIfOneArgFalse [
	self assertReadEval: '(if false 1)' equals: MalNil new
]

{ #category : #tests }
MalTest >> testIfTrue [
	self assertReadEval: '(if true 1 (no-such-fun))' equals: (MalInteger withValue: 1)
]

{ #category : #tests }
MalTest >> testLet [
	self
		assertReadEval: '(let* (x 1) 2 x)'
		equals: (MalInteger withValue: 1)
]

{ #category : #tests }
MalTest >> testLetBindingNotSymbol [
	| letExpr |
	letExpr := Mal read: '(let* (1 2) x)'.
	self should: [ letExpr evalIn: MalContext default ] raise: MalError
]

{ #category : #tests }
MalTest >> testLetOddBindings [
	| letExpr |
	letExpr := Mal read: '(let* (x 1 2) x)'.
	self should: [ letExpr evalIn: MalContext default ] raise: MalError
]

{ #category : #tests }
MalTest >> testLetWrongArgs [
	| letExpr |
	letExpr := Mal read: '(let* 3 x)'.
	self should: [ letExpr evalIn: MalContext default ] raise: MalError
]

{ #category : #tests }
MalTest >> testOrGensym [
	self
		assertReadEval: '(let* [or_FIXME 23] (or false (+ or_FIXME 100)))'
		equals: (MalInteger withValue: 123)
]
