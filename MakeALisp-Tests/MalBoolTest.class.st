"
I test methods on WMalBool objects.
"
Class {
	#name : #MalBoolTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalBoolTest >> testEvalIn [
	| val |
	val := MalBool withValue: false.
	self assert: (val evalIn: nil) equals: val
]

{ #category : #tests }
MalBoolTest >> testPrint [
| val|
val := MalBool withValue: false.
self assert: (val asReadableString) equals: 'false'.
]
