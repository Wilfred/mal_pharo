"
A MalFunctionTest is a test class for testing the behavior of MalFunction
"
Class {
	#name : #MalFunctionTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalFunctionTest >> testSubclassesHaveUniqueNames [
	| funcs |
	funcs := Dictionary new.
	MalFunction
		allSubclassesDo: [ :func | 
			| matchingFuncs |
			matchingFuncs := funcs
				at: func malName
				ifAbsent: OrderedCollection new.
			matchingFuncs add: func.
			funcs at: func malName put: matchingFuncs ].
	funcs
		associationsDo: [ :assoc | 
			self
				assert: assoc value size = 1
				description:
					('{1} classes with malName {2}'
						format:
							{assoc value size.
							assoc key}) ]
]
