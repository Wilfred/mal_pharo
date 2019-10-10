"
I represent boolean values (true and false) in MAL.
"
Class {
	#name : #MalBool,
	#superclass : #MalType,
	#category : #MakeALisp
}

{ #category : #accessing }
MalBool >> asReadableString [
	^ self value asString
]

{ #category : #accessing }
MalBool >> isTruthy [
^ self value
]
