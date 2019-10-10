"
Testing the list? function.
"
Class {
	#name : #MalListPredicateTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalListPredicateTest >> testCallArity [
	| args |
	args := OrderedCollection new.
	self
		should: [ MalListPredicate new call: args withContext: nil ]
		raise: MalWrongArity 
]

{ #category : #tests }
MalListPredicateTest >> testCallNotList [
	| args |
	args := OrderedCollection
		with: (MalInteger withValue: 1).
	self
		assert: (MalListPredicate new call: args withContext: nil)
		equals: (MalBool withValue: false)
]

{ #category : #tests }
MalListPredicateTest >> testCallWithContext [
	| args |
	args := OrderedCollection
		with: (MalList new).
	self
		assert: (MalListPredicate new call: args withContext: nil)
		equals: (MalBool withValue: true)
]
