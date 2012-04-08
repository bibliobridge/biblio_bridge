class Book
  include Mongoid::Document

  field :title, type: String
  field :keywords, type: Array

  def self.search_by_title title
    any_in keywords: StringTokenizer.keywordize(title)
  end
end

