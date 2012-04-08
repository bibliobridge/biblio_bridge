class BookObserver < Mongoid::Observer
  observe :book

  def generate_keywords book
    book.keywords = StringTokenizer.new(book.title).as_keywords
  end

  def before_save book
    generate_keywords book
  end
end

