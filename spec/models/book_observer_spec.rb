require 'spec_helper'

describe BookObserver do
  subject { BookObserver.send :new }
  def book title
    mock title: title
  end

  let(:algos) { "A Book on Algorithms" }
  let(:algos_book) { book algos }
  let(:what) { "What is the name of this book?" }
  let(:what_book) { book what }

  describe "#generate_keywords" do
    it "keywordizes the title and saves as keywords" do
      algos_book.should_receive(:keywords=).with [ "book", "algorithms" ]
      subject.generate_keywords algos_book

      what_book.should_receive(:keywords=).with ["what", "name", "book"]
      subject.generate_keywords what_book
    end
  end
end

