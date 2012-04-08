class Book
  include Mongoid::Document

  has_many :offers

  field :title, type: String
  field :keywords, type: Array

  def available?
    offers.count > 0
  end

  def self.search_by_title title
    any_in keywords: StringTokenizer.keywordize(title)
  end
end

