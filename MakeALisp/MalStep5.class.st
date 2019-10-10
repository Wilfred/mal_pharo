"
I am a CLI interface for executing Mal expressions.

You can use me as follows:

    $ echo '(+ 1 2)' | ~/Pharo/vms/70-x64/pharo -headless ~/Pharo/images/WMal/WMal.image step5_mal 2>/dev/null
"
Class {
	#name : #MalStep5,
	#superclass : #MalStep,
	#classInstVars : [
		'env'
	],
	#category : #MakeALisp
}

{ #category : #accessing }
MalStep5 class >> commandName [
	^ 'step5_mal'
]
