Feature: Claim a book
	In order to succeed
	As a student in need
	I want to claim a book

	Scenario: Claim an available book
		Given I am logged in
		Given a book is in the library
		And the book is available
		When I view the book
		And I claim the book
		Then I should get a notification

