"
I represent atom values in MAL.
"
Class {
	#name : #MalAtom,
	#superclass : #MalType,
	#category : #MakeALisp
}

{ #category : #accessing }
MalAtom >> asReadableString [
	^ '(atom ', self value asReadableString , ')'
]
