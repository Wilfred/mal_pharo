"
Utility tests to ensure special forms are uniquely named.
"
Class {
	#name : #MalSpecialFormTest,
	#superclass : #TestCase,
	#category : #'MakeALisp-Tests'
}

{ #category : #tests }
MalSpecialFormTest >> testSubclassesHaveUniqueNames [
	| nameCounts |
	nameCounts := Dictionary new.
	MalSpecialForm 
		allSubclassesDo: [ :func | 
			| count |
			count := nameCounts at: func malName ifAbsent: 0.
			nameCounts at: func malName put: count + 1 ].
	nameCounts
		associationsDo: [ :assoc | 
			self
				assert: assoc value = 1
				description:
					('{1} classes with malName {2}'
						format:
							{assoc value.
							assoc key}) ]
]
