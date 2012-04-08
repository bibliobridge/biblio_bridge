When /^I search for the book's title$/ do
  visit search_path
  fill_in "title", with: @book.title
  click_on "search"
end

