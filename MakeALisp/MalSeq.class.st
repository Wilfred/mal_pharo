"
I represent the seq function.
"
Class {
	#name : #MalSeq,
	#superclass : #MalFunctionOneArg,
	#category : #MakeALisp
}

{ #category : #accessing }
MalSeq class >> malName [
	^ 'seq'
]

{ #category : #evaluating }
MalSeq >> callArg: arg withContext: ctx [
	arg isPair
		ifTrue: [ ^ MalList withValue: arg value ].
	arg class = MalString & (arg value = '')
		ifTrue: [ ^ MalNil new ].
	arg class = MalString
		ifTrue: [ ^ MalList
				withValue:
					(arg value
						collect: [ :c | MalString withValue: c asString ]
						into: OrderedCollection new) ].
	^ MalNil new
]
