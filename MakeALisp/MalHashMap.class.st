"
I represent hash maps {:foo ""bar""} in MAL.
"
Class {
	#name : #MalHashMap,
	#superclass : #MalType,
	#category : #MakeALisp
}

{ #category : #initialization }
MalHashMap class >> withItems: items [
	| value |
	value := Dictionary new.
	items pairsDo: [ :k :v | value at: k put: v ].
	^ self withValue: value
]

{ #category : #accessing }
MalHashMap >> asReadableString [
	| printedItems |
	printedItems := OrderedCollection new.
	value
		associationsDo: [ :assoc | 
			printedItems add: assoc key asReadableString.
			printedItems add: assoc value asReadableString ].
	^ '{' , (' ' join: printedItems) , '}'
]

{ #category : #accessing }
MalHashMap >> asString [
	| printedItems |
	printedItems := OrderedCollection new.
	value
		associationsDo: [ :assoc | 
			printedItems add: assoc key asString.
			printedItems add: assoc value asString ].
	^ '{' , (' ' join: printedItems) , '}'
]

{ #category : #accessing }
MalHashMap >> evalIn: ctx [
	| evalledItems |
	evalledItems := self value
		associations collect: [ :assoc | ((assoc key) evalIn: ctx) -> ((assoc value) evalIn: ctx) ].
	^ MalHashMap withValue: (Dictionary newFrom: evalledItems)
]
