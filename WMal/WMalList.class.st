"
I represent a list value in MAL.
"
Class {
	#name : #WMalList,
	#superclass : #WMalType,
	#category : #WMal
}

{ #category : #accessing }
WMalList >> print [
   | inner |
inner := ' ' join: (value collect: #print).
^ '(', inner, ')'
]

{ #category : #accessing }
WMalList >> size [
	^ value size
]
