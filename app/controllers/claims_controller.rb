class ClaimsController < ApplicationController
  def create
    book = Book.find params[:book_id]
    current_user.claim book.offers.first
    flash[:notice] = "Thanks check your phone!"
    redirect_to root_path
  end

  def destroy
  end
end

