"
A MalMapFunctionTest is a test class for testing the behavior of MalMapFunction
"
Class {
	#name : #MalMapFunctionTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalMapFunctionTest >> testCallWithContext [
	| ctx expr |
	expr := Mal read: '(map (fn* [x] (+ x 1)) [1 2])'.
	ctx := MalContext default.
	self
		assert: (expr evalIn: ctx)
		equals:
			(MalList
				with: (MalInteger withValue: 2)
				with: (MalInteger withValue: 3))
]

{ #category : #tests }
MalMapFunctionTest >> testCallWithContextQuotedList [
	| ctx expr t f |
	expr := Mal read: '(map (fn* (x) (symbol? x)) (list 1 (quote two) "three"))'.
	ctx := MalContext default.
	t := MalBool withValue: true.
	f := MalBool withValue: false.
	self
		assert: (expr evalIn: ctx)
		equals:
			(MalList
				with: f with: t with: f)
]
