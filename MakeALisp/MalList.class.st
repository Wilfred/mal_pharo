"
I represent a list value in MAL.

My API is similar to OrderedCollection for convenience.
"
Class {
	#name : #MalList,
	#superclass : #MalType,
	#category : #MakeALisp
}

{ #category : #'instance creation' }
MalList class >> with: value [
^ self withValue: (OrderedCollection with: value)
]

{ #category : #'instance creation' }
MalList class >> with: value1 with: value2 [
	^ self withValue: (OrderedCollection with: value1 with: value2)
]

{ #category : #'instance creation' }
MalList class >> with: value1 with: value2 with: value3 [
	^ self withValue: (OrderedCollection with: value1 with: value2 with: value3)
]

{ #category : #accessing }
MalList >> allButFirst [
	^ self allButFirst: 1
]

{ #category : #accessing }
MalList >> allButFirst: n [
	^ self class withValue: (value allButFirst: n)
]

{ #category : #accessing }
MalList >> asReadableString [
   | inner |
inner := ' ' join: (value collect: #asReadableString).
^ '(', inner, ')'
]

{ #category : #converting }
MalList >> asString [
	| inner |
	inner := ' ' join: (value collect: #asString).
	^ '(' , inner , ')'
]

{ #category : #accessing }
MalList >> evalIn: ctx [
	| items evalledItems func expanded |
	expanded := self macroexpandAllIn: ctx.
	items := expanded value.
	"A call is a non-empty list after macro expansion."
	expanded isPair
		ifFalse: [ expanded class = MalList
				ifTrue: [ "Empty list evaluates to itself." ^ expanded ]
				ifFalse: [ "E.g. symbol" ^ expanded evalIn: ctx ] ].
	"Special forms."
	(MalSpecialForm matchesSymbol: items first)
		ifNotNil: [ :f | ^ f call: items allButFirst withContext: ctx ].
	"Evaluate all the items in the list, then call the first arg with the rest."
	evalledItems := items collect: [ :item | item evalIn: ctx ].
	func := evalledItems first.
	^ func call: evalledItems allButFirst withContext: ctx
]

{ #category : #accessing }
MalList >> initialize [ 
super initialize .
value := OrderedCollection new.
]

{ #category : #accessing }
MalList >> isIterable [ ^ true
]

{ #category : #accessing }
MalList >> isPair [
	^ self value isNotEmpty
]

{ #category : #accessing }
MalList >> macroexpandIn: ctx [
	| head headVal |
	self value ifEmpty: [ ^ self ].
	head := self value first.
	"If the first item evaluates to a macro."
	head class = MalSymbol
		ifFalse: [ ^ self ].
	headVal := [ head evalIn: ctx ]
		on: MalUnboundSymbol
		do: [ ^ self ].
	headVal isMacro
		ifTrue: [ ^ headVal call: (self value allButFirst) withContext: ctx ]
		ifFalse: [ ^ self ].
]

{ #category : #accessing }
MalList >> size [
	^ value size
]
