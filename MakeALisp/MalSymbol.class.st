"
I represent symbols in MAL.

I use Smalltalk strings to represent  a MAL symbol rather than Smalltalk symbols. This is
to avoid issues with MAL symbols that aren't valid Smalltalk symbols.

Two symbols are equal if they have the same string value.
"
Class {
	#name : #MalSymbol,
	#superclass : #MalType,
	#category : #MakeALisp
}

{ #category : #'initialize-release' }
MalSymbol class >> withValue: aString [
	| instance |
	instance := self new.
	^instance value: aString.

]

{ #category : #accessing }
MalSymbol >> asReadableString [
	^ value
]

{ #category : #accessing }
MalSymbol >> evalIn: ctx [
	ctx env
		at: self value
		ifPresent: [ :currentValue | ^ currentValue ]
		ifAbsent:
			[ MalUnboundSymbol signal: '''' , self value , ''' not found' ]
]
