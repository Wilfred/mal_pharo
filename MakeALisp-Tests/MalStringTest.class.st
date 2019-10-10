"
Testing string literals.
"
Class {
	#name : #MalStringTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalStringTest >> testPrint [
	| string contents |
	contents := 'foo"bar\baz' , Character lf asString , 'biz'.
	string := MalString
		withValue:
			contents.
	self assert: string asReadableString equals: '"foo\"bar\\baz\nbiz"'
]

{ #category : #tests }
MalStringTest >> testReadPrintRoundTrip [
	"Ensure that reading and then printing a string gives us the original input."

	| string input |
	input := '"foo\"bar\\baz\nbiz boz"'.
	string := MalReader readString: input.
	self assert: string asReadableString equals: input
]
