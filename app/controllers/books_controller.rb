class BooksController < ApplicationController
  def index
    if params[:title]
      @books = Book.where(title: params[:title]).all
    end
  end
end
