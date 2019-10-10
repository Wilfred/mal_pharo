"
I represent keywords  in MAL.

Keywords are symbols that start with :, e.g. :foo.

Keywords evaluate to themselves.
"
Class {
	#name : #MalKeyword,
	#superclass : #MalType,
	#category : #MakeALisp
}

{ #category : #accessing }
MalKeyword >> asReadableString [
	^ value
]
