"
I convert the string 'nil' to the MAL nil value.
"
Class {
	#name : #MalNilLiteral,
	#superclass : #MalLiteral,
	#category : #MakeALisp
}

{ #category : #testing }
MalNilLiteral class >> fromToken: aString [
	^ MalNil new
]

{ #category : #testing }
MalNilLiteral class >> matches: aString [
	^ aString = 'nil'
]
