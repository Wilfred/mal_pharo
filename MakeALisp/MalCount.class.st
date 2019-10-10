"
I represent the count function in MAL.
"
Class {
	#name : #MalCount,
	#superclass : #MalFunctionOneArg,
	#category : #MakeALisp
}

{ #category : #accessing }
MalCount class >> malName [
^ 'count'
]

{ #category : #evaluating }
MalCount >> callArg: arg withContext: ctx [
	"MAL requires nil to return 0, so return 0 for any non-list."

	arg isIterable
		ifFalse: [ ^ MalInteger withValue: 0 ].
	^ MalInteger withValue: arg size
]
