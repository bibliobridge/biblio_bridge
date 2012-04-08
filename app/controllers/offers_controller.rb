class OffersController < ApplicationController
  def create
    book = Book.find params[:book_id]
    current_user.offers.create book: book
    flash[:notice] = "Thanks for offering your copy of #{book.title}!"
    redirect_to root_path
  end

  def destroy
  end
end

