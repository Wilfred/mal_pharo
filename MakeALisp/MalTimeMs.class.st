"
I represent the time-ms function.
"
Class {
	#name : #MalTimeMs,
	#superclass : #MalFunction,
	#category : #MakeALisp
}

{ #category : #accessing }
MalTimeMs class >> malName [
	^ 'time-ms'
]

{ #category : #accessing }
MalTimeMs >> call: args withContext: ctx [
	| now milliseconds |
	self ensure: args haveArity: 0.
	now := DateAndTime now asUTC.
	milliseconds := (now second * 1000) + (now nanoSecond // 1000000).
	^ MalInteger withValue: milliseconds

]
