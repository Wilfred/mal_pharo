"
I represent whole numbers in MAL.
"
Class {
	#name : #MalInteger,
	#superclass : #MalType,
	#category : #MakeALisp
}

{ #category : #accessing }
MalInteger >> asReadableString [
	^ self value asString
]
