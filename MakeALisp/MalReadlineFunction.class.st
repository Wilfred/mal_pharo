"
I represent the readline function.
"
Class {
	#name : #MalReadlineFunction,
	#superclass : #MalFunctionOneArg,
	#category : #MakeALisp
}

{ #category : #accessing }
MalReadlineFunction class >> malName [
	^ 'readline'
]

{ #category : #evaluating }
MalReadlineFunction >> callArg: arg withContext: ctx [
   self ensure: arg hasType: MalString.
	^ MalString withValue: (MalReadLine read: ctx stdout withPrompt: arg value)
]
