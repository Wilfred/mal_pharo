"
I represent the do special form in MAL.
"
Class {
	#name : #MalDo,
	#superclass : #MalSpecialForm,
	#category : #MakeALisp
}

{ #category : #evaluating }
MalDo class >> call: args withContext: ctx [
	| result |
	result := nil.
	args do: [ :expr | result := expr evalIn: ctx ].
	^ result
]

{ #category : #accessing }
MalDo class >> malName [
	^ 'do'
]
