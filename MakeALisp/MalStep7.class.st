"
I am a CLI interface for executing Mal expressions.

You can use me as follows:

Interactively:

    $ ~/Pharo/vms/70-x64/pharo -headless ~/Pharo/images/WMal/WMal.image step7_mal 2>/dev/null

One-off execution:

    $ echo '(+ 1 2)' | ~/Pharo/vms/70-x64/pharo -headless ~/Pharo/images/WMal/WMal.image step7_mal 2>/dev/null

If you encounter a bug and want to use Pharo's debugger:

    $ echo '(+ 1 2)' |~/Pharo/vms/70-x64/pharo ~/Pharo/images/WMal/WMal.image step7_mal
"
Class {
	#name : #MalStep7,
	#superclass : #MalStep,
	#classInstVars : [
		'env'
	],
	#category : #MakeALisp
}

{ #category : #accessing }
MalStep7 class >> commandName [
	^ 'step7_mal'
]
