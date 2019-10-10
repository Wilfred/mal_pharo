"
I represent the quote special form in MAL.
"
Class {
	#name : #MalQuote,
	#superclass : #MalSpecialForm,
	#category : #MakeALisp
}

{ #category : #evaluating }
MalQuote class >> call: args withContext: ctx [
	args size = 1
		ifFalse: [ MalWrongArity
				signal: ('quote requires 1 argument (got {1})' format: {args size}) ].
	^ args first
]

{ #category : #accessing }
MalQuote class >> malName [
	^ 'quote'
]
