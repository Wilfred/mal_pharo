"
I represent the println function in MAL.
"
Class {
	#name : #MalPrintln,
	#superclass : #MalFunction,
	#category : #MakeALisp
}

{ #category : #accessing }
MalPrintln class >> malName [
	^ 'println'
]

{ #category : #evaluating }
MalPrintln >> call: args withContext: ctx [
	ctx stdout
		<< (' ' join: (args collect: #asString));
		lf.
	^ MalNil new
]
