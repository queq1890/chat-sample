class UsersController < ApplicationController

  def edit
  end

  def update
   current_user.update(user_params)
  end

  private
  def user_params
    params.permit(:name, :email)
  end
end
