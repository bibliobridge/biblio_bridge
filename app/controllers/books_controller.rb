class BooksController < ApplicationController
  def show
    @book = Book.find params[:id]
  end

  def index
    if params[:title]
      @books = Book.search_by_title params[:title]
    else
      @books = Book.all
    end
  end
end
