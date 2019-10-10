"
I represent the nil value in MAL.
"
Class {
	#name : #MalNil,
	#superclass : #MalType,
	#category : #MakeALisp
}

{ #category : #accessing }
MalNil >> asReadableString [
	^ 'nil'
]

{ #category : #accessing }
MalNil >> isTruthy [
^ false
]

{ #category : #accessing }
MalNil >> printOn: aStream [
	aStream
		nextPutAll: 'a WMalNil'
]
