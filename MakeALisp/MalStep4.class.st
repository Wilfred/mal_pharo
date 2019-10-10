"
I am a CLI interface for executing Mal expressions, supporting binding of variables.

You can use me as follows:

    $ echo '(+ 1 2)' | ~/Pharo/vms/70-x64/pharo -headless ~/Pharo/images/WMal/WMal.image step4_mal 2>/dev/null
"
Class {
	#name : #MalStep4,
	#superclass : #MalStep,
	#classInstVars : [
		'env'
	],
	#category : #MakeALisp
}

{ #category : #accessing }
MalStep4 class >> commandName [
	^ 'step4_mal'
]
