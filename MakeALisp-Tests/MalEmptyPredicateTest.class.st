"
Testing the empty? function in MAL.
"
Class {
	#name : #MalEmptyPredicateTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalEmptyPredicateTest >> testCallWithContext [
	| args |
	args := OrderedCollection
		with: (MalList new).
	self
		assert: (MalEmptyPredicate new call: args withContext: nil)
		equals: (MalBool withValue: true)
]
