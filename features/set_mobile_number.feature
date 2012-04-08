Feature: Setting Mobile Number
	In order to know when a book is available
	As a modern student
	I want to give a mobile number that can be texted

	Scenario: First sign in
		Given I have not ever logged in
		When I log in with Facebook
		Then I should be prompted for my mobile number

	Scenario: Returning user signs in
		Given I have logged in before
		And my mobile number is set
		When I log in with Facebook
		Then I should be taken to the homepage

