class StringTokenizer
  attr_reader :string
  STOPWORDS = %w[a an and as is or the]

  def initialize string
    @string = string
  end

  def as_tokens
    @tokens ||= string.split /\s/
  end

  def filter_stopwords
    @without_stopwords ||= as_tokens.reject{ |token| STOPWORDS.include? token }
  end

  def as_keywords
    @keywords = filter_stopwords.uniq.map &:downcase
  end

  def self.keywordize string
    new(string).as_keywords
  end
end

