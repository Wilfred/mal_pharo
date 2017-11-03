"
Testing methods on WMalList.
"
Class {
	#name : #WMalListTest,
	#superclass : #TestCase,
	#category : #'WMal-Tests'
}

{ #category : #tests }
WMalListTest >> testPrint [
	| val first second items |
	first := WMalInteger withValue: 1.
	second := WMalInteger withValue: 2.
	items := OrderedCollection with: first with: second.
	val := WMalList withValue: items.
	
	self assert: val print equals: '(1 2)'
]
