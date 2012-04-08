Given /^a book is in the library$/ do
  @book = Book.create title: "Code Simplicity"
end

Given /^the book is available$/ do
  @book.offers.create
end

Then /^I should see the book$/ do
  page.should have_content @book.title
end


When /^I view the book$/ do
  visit book_path @book
end

When /^I claim the book$/ do
  click_on "Claim this book"
end

