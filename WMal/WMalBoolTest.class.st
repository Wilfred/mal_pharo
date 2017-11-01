"
I test methods on WMalBool objects.
"
Class {
	#name : #WMalBoolTest,
	#superclass : #TestCase,
	#category : #'WMal-Tests'
}

{ #category : #tests }
WMalBoolTest >> testPrint [
| val|
val := WMalBool withValue: false.
self assert: (val print) equals: 'false'.
]
