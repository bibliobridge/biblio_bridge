require 'spec_helper'

describe Book do
  describe ".search_by_title" do
    let!(:cs_book) { Book.create title: "Introduction to Algorithms" }
    let!(:math_book) { Book.create title: "Introduction to Elementary Topology" }

    it "searches within keywords to find books" do
      pending "Need to add Database cleaner to RSpec"
      books = Book.search_by_title "Introduction to Topology"
      books.each_with_index do |book, i|
        puts "#{i}: #{book.title}"
      end
    end
  end
end

