"
Testing how hash maps { foo bar } evaluate in MAL.
"
Class {
	#name : #MalHashMapTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalHashMapTest >> testEval [
	| val expected |
	val := Mal read: '{:foo (+ 2 3)}'.
	expected := Mal read: '{:foo 5}'.
	self assert: (val evalIn: MalContext default) equals: expected
]

{ #category : #tests }
MalHashMapTest >> testPrint [
	| key value hashMap |
	key := MalString withValue: 'foo'.
	value := MalInteger withValue: 1.
	hashMap := MalHashMap withValue: (Dictionary with: key -> value).
	self assert: hashMap asReadableString equals: '{"foo" 1}'
]
