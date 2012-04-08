class BooksController < ApplicationController
  def index
    if params[:title]
      @books = Book.search_by_title params[:title]
    else
      @books = Book.all
    end
  end
end
