"
I repressent the pr-str function in MAL.
"
Class {
	#name : #MalPrStr,
	#superclass : #MalFunction,
	#category : #MakeALisp
}

{ #category : #accessing }
MalPrStr class >> malName [
	^ 'pr-str'
]

{ #category : #evaluating }
MalPrStr >> call: args withContext: ctx [
	| printedArgs |
	printedArgs := args collect: [ :arg | arg asReadableString ].
	^ MalString withValue: (' ' join: printedArgs)
]
