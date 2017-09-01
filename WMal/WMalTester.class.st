"
A utility class for playing with the WMal class.
"
Class {
	#name : #WMalTester,
	#superclass : #Object,
	#category : #WMal
}

{ #category : #accessing }
WMalTester class >> evalString: aString [
	"comment stating purpose of message"

	|   |
	^ WMal new rep: aString.
]
