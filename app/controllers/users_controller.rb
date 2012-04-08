class UsersController < ApplicationController
  before_filter :require_login
  def edit
  end

  def update
    if params[:user].has_key? :mobile_number
      @user.mobile_number = params[:user][:mobile_number]
      flash[:notice] = "Mobile number updated successfully!"
      @user.save!
      redirect_to root_path
    end
  end

  def require_login
    if signed_in?
      @user = current_user
    else
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_path
    end
  end
end

