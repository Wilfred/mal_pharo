"
I parse MAL tokens from a string.
"
Class {
	#name : #WMalTokenizer,
	#superclass : #Object,
	#instVars : [
		'source'
	],
	#classVars : [
		'TokenPattern'
	],
	#classInstVars : [
		'source'
	],
	#category : #WMal
}

{ #category : #initialization }
WMalTokenizer class >> initialize [
	"This isn't exactly the same as the MAL docs.
We are forced to treat [ and ] separately due to syntax limitations
in the regex engine."
	TokenPattern := '[\s,]*(~@|\[|[]{}()''`~^@]|"(\\.|[^\\"])*"|;.*|(\[|\]|[^\s{}(''"`,;)])*)'
]

{ #category : #'instance creation' }
WMalTokenizer class >> withSource: aString [
	"Initialise with source code specified."

	| instance |
	instance := self new.
	instance source: aString.
	^ instance
]

{ #category : #accessing }
WMalTokenizer >> source: aString [


	source := aString
]

{ #category : #'instance creation' }
WMalTokenizer >> tokenize [
	"Return a collection of all the tokens in our string."

	| matcher result |
	matcher := RxMatcher forString: TokenPattern.
	result := OrderedCollection new.
	matcher
		matchesOnStream: source readStream
		do: [ :s :m | result add: (m subexpression: 2) ].
	^ result reject: [ :str | str isEmpty ]
]
