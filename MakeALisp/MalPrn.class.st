"
The built-in prn function in MAL.
"
Class {
	#name : #MalPrn,
	#superclass : #MalFunction,
	#category : #MakeALisp
}

{ #category : #accessing }
MalPrn class >> malName [
^ 'prn'
]

{ #category : #evaluating }
MalPrn >> call: args withContext: ctx [
  | printedArgs |
printedArgs := args collect: [ :arg | arg asReadableString ].
		ctx stdout
		<< (' ' join: printedArgs);
		lf.
	^ MalNil new
]
