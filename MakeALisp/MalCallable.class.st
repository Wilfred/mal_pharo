"
I'm the base class for all callable values in MAL.

This covers both built-in functions and user-defined functions. Note
that macros are special cases of functions.
"
Class {
	#name : #MalCallable,
	#superclass : #MalType,
	#category : #MakeALisp
}

{ #category : #accessing }
MalCallable >> isCallable [ ^ true
]
