"
I represent the map? function.
"
Class {
	#name : #MalMapPredicate,
	#superclass : #MalFunctionOneArg,
	#category : #MakeALisp
}

{ #category : #accessing }
MalMapPredicate class >> malName [
	^ 'map?'
]

{ #category : #evaluating }
MalMapPredicate >> callArg: arg withContext: ctx [
	^ MalBool withValue: arg class = MalHashMap 
]
