"
I represent the meta function that extracts metadata from callables.
"
Class {
	#name : #MalMetaFunction,
	#superclass : #MalFunctionOneArg,
	#category : #MakeALisp
}

{ #category : #accessing }
MalMetaFunction class >> malName [
	^ 'meta'
]

{ #category : #evaluating }
MalMetaFunction >> callArg: arg withContext: ctx [
   ^arg meta ifNil: [ MalNil new ]

]
