Feature: Book search
	In order to save money
	As a broke college student
	I want to find a book to borrow

	Scenario: Search by exact title
		Given a book is in the library
		When I search for the book's title
		Then I should see the book
