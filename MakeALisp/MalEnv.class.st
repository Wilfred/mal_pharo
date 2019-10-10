"
I represent environments in MAL. I look up symbols, and can defer to
outer environments if a symbol isn't present in my bindings.

My API roughly follows Dictionary.

I also hold references to Smalltalk objects that MAL needs, such as stdout.
"
Class {
	#name : #MalEnv,
	#superclass : #Object,
	#instVars : [
		'bindings',
		'outer',
		'stdout'
	],
	#category : #MakeALisp
}

{ #category : #'instance creation' }
MalEnv class >> default [
	| env |
	env := self new.
	MalFunction allSubclassesDo: [ :func | env at: (MalSymbol withValue: func malName) put: func new ].
	^ env
		
]

{ #category : #'instance creation' }
MalEnv class >> new [
	^ super new
		bindings: Dictionary new;
		yourself
]

{ #category : #'instance creation' }
MalEnv class >> withOuter: env [
	self
		assert: [ env class = self ]
		description: [ 'Outer env class should match this env' ].
	^ self new
		outer: env;
		yourself
]

{ #category : #acccessing }
MalEnv >> at: aSymbol [
	| key |
	self
		assert: [ aSymbol class = MalSymbol ]
		description: 'env keys should be symbols'.
	key := aSymbol value.
	^ self
		at: key
		ifAbsent: [ MalUnboundSymbol signal: 'Unbound variable: ' , key ]
]

{ #category : #acccessing }
MalEnv >> at: aSymbol ifAbsent: aBlock [
	| key |
	key := aSymbol value.
	^ bindings
		at: key
		ifAbsent: [ outer
				ifNotNil: [ ^ outer at: key ifAbsent: aBlock ]
				ifNil: [ aBlock value ] ]
]

{ #category : #acccessing }
MalEnv >> at: aSymbol ifPresent: presentBlock ifAbsent: absentBlock [
	| key |
	key := aSymbol value.
	^ bindings
		at: key
		ifPresent: [ :value | ^ presentBlock cull: value ]
		ifAbsent: [ outer
				ifNotNil: [ ^ outer at: key ifPresent: presentBlock ifAbsent: absentBlock ]
				ifNil: [ absentBlock value ] ]
]

{ #category : #setter }
MalEnv >> at: aSymbol put: value [
	"Insert this symbol at this level"

	| key |
		self
		assert: [ aSymbol class = MalSymbol ]
		description: 'env keys should be symbols'.
	key := aSymbol value.
	bindings at: key put: value
]

{ #category : #setter }
MalEnv >> bindings: aDictionary [
	bindings := aDictionary
]

{ #category : #accessing }
MalEnv >> outer [
	^ outer
]

{ #category : #setter }
MalEnv >> outer: aLinkedDictionary [
	outer := aLinkedDictionary
]
