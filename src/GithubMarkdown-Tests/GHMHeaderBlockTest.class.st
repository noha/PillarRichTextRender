"
A GHMHeaderBlockTest is a test class for testing the behavior of GHMHeaderBlock
"
Class {
	#name : #GHMHeaderBlockTest,
	#superclass : #TestCase,
	#category : #'GithubMarkdown-Tests'
}

{ #category : #tests }
GHMHeaderBlockTest >> testHeaderLevel1 [
	| source root |
	source := '# Level1'.
	root := GHMParser new parse: source.
	self assert: root children size equals: 1.
	self assert: root children first header equals: 'Level1'.
	self assert: root children first level equals: 1
]

{ #category : #tests }
GHMHeaderBlockTest >> testHeaderLevel4 [
	| source root |
	source := '####    Level four'.
	root := GHMParser new parse: source.
	self assert: root children size equals: 1.
	self assert: root children first header equals: 'Level four'.
	self assert: root children first level equals: 4
]

{ #category : #tests }
GHMHeaderBlockTest >> testHeaderLevel4AsPillar [
	| source root pillar |
	source := '####    Level four'.
	root := GHMParser new parse: source.
	pillar := root children first asPillar.
	self assert: pillar class equals: PRHeader.
	self assert: pillar children first class equals: PRText.
	self assert: pillar children first text equals: 'Level four'
]
