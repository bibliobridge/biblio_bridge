require "./lib/string_tokenizer"

describe StringTokenizer do
  let(:string_of_words) { "The rain in Spain falls mainly on the plain." }
  let(:string_with_tabs_and_newlines) { "This\nstring   \tugly whitespace" }
  let(:subject) { StringTokenizer.new string_of_words }

  describe "#as_tokens" do
    it "removes spaces from tokens" do

      subject.as_tokens.each do |t|
        t.should_not =~ / /
      end
    end

    it "separates on any whitespace" do
      tokens = StringTokenizer.new(string_with_tabs_and_newlines).as_tokens
      tokens.shift.should == "This"
      tokens.shift.should == "string"
    end

    it "removes any other whitespaces from string" do
      subject.as_tokens.each do |t|
        t.should_not =~ /\s/
      end
    end

    describe "#filter_stopwords" do
      it "removes given stopwords" do
        subject.filter_stopwords.each do |t|
          StringTokenizer::STOPWORDS.should_not include t
        end
      end
    end

    describe "#as_keywords" do
      it "converts everything to lower case" do
        subject.as_keywords.each do |t|
          t.should_not =~ /[A-Z]/
        end
      end

      it "filters out non-unique words" do
        keywords = subject.as_keywords
        keywords.should == keywords.uniq
      end
    end
  end
end

