"
I am the base class for all Mal command line handlers. I write a prompt, read input from the user, then dispatch.
"
Class {
	#name : #MalStep,
	#superclass : #CommandLineHandler,
	#instVars : [
		'ctx'
	],
	#category : #MakeALisp
}

{ #category : #accessing }
MalStep class >> commandName [
	^ ''
]

{ #category : #activation }
MalStep >> activate [
	ctx setArgv: (self commandLine ).
	[ self activateUnchecked ]
		on: Error
		do: [ self stdout
				<< thisContext longStack;
				lf.
			self exitFailure ]
]

{ #category : #activation }
MalStep >> activateUnchecked [
	| input |
	input := self readInputLine .
	[ input isEmptyOrNil ]
		whileFalse: [ self stdout
				<< (self rep: input) asString;
				lf.
			input := self readInputLine ].
	self stdout lf.
	self exitSuccess
]

{ #category : #activation }
MalStep >> evalFile: path [
	| input fileRef source |
	fileRef := path asFileReference.
	fileRef exists
		ifFalse: [ self stdout
				<< 'No such file';
				lf.
			^ self exitFailure ].
	fileRef isFile ifFalse: [ self stdout
				<< 'Not a file';
				lf. ].
	source := fileRef readStream upToEnd.
	self exitSuccess
]

{ #category : #initialization }
MalStep >> initialize [
	super initialize.
	ctx := MalContext default
		stdout: self stdout;
		yourself.

]

{ #category : #activation }
MalStep >> readInputLine [
	^ MalReadLine read: self stdout withPrompt: 'user> '
]

{ #category : #activation }
MalStep >> rep: aString [
	^ [ Mal rep: aString in: ctx ]
		on: MalError
		do: [ :ex | ex messageText ]
]
