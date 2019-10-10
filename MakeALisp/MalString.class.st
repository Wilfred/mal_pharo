"
I represent string values in MAL.
"
Class {
	#name : #MalString,
	#superclass : #MalType,
	#category : #MakeALisp
}

{ #category : #accessing }
MalString >> asReadableString [
	| inner |
	inner := self value copyReplaceAll: '\' with: '\\'.
	inner := inner copyReplaceAll: Character lf asString with: '\n'.
	inner := inner copyReplaceAll: Character cr asString with: '\r'.
	inner := inner copyReplaceAll: '"' with: '\"'.
	^ '"' , inner , '"'
]

{ #category : #converting }
MalString >> asString [ 
^ value
]
