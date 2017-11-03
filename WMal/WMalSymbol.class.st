"
I represent symbols in MAL.

I use Smalltalk strings to represent  a MAL symbol rather than Smalltalk symbols. This is
to avoid issues with MAL symbols that aren't valid Smalltalk symbols.

Two symbols are equal if they have the same string value.
"
Class {
	#name : #WMalSymbol,
	#superclass : #WMalType,
	#category : #WMal
}

{ #category : #'initialize-release' }
WMalSymbol class >> withValue: aString [
	| instance |
	instance := self new.
	^instance value: aString.

]

{ #category : #comparing }
WMalSymbol >> = anObject [ 
	"Answer whether the receiver and the argument represent the same 
	object. If = is redefined in any subclass, consider also redefining the 
	message hash."

	^self == anObject 
]

{ #category : #accessing }
WMalSymbol >> print [
	^ value
]
