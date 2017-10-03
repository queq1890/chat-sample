class UsersController < ApplicationController

  def edit
  end

  def update
   user = User.find(params[:id])
   user.update(user_params)
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
