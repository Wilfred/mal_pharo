"
I parse MAL tokens from a string.
"
Class {
	#name : #MalTokenizer,
	#superclass : #Object,
	#classVars : [
		'TokenPattern'
	],
	#category : #MakeALisp
}

{ #category : #'instance creation' }
MalTokenizer class >> fromString: aString [
	"Return a collection of all the tokens in our string."

	| pattern matcher result |
	"This isn't exactly the same as the MAL docs.
   We are forced to treat [ and ] separately due to syntax limitations
   in the regex engine (a range cannot contain [, see 
	https://stackoverflow.com/questions/45824000/) and 
	we ban carriage return/line feeds in comments."
	pattern := '[\s,]*(~@|\[|\]|[{}()''`~^@]|"(\\.|[^\\"])*"|;[^', Character cr asString , Character lf asString , ']*|([^]\s{}(''"`,;)])*)'.
	matcher := RxMatcher forString: pattern.
	result := matcher
		matchesOnStream: aString readStream
		collect: [ :s | matcher subexpression: 2 ].
	^ result reject: [ :str | str isEmpty or: [ str first = $; ] ]
]
