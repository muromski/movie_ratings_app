class UsersController < ApplicationController
  def show
    @user = User.includes(reviews: :movie).find_by_id(params[:id])
  end
end
