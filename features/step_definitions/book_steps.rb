Given /^a book is in the library$/ do
  @book = Book.new title: "Code Simplicity"
end

Then /^I should see the book$/ do
  page.should have_content @book.title
end

