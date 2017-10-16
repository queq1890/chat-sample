class UsersController < ApplicationController
  before_action :authenticate_user!, only: :edit

  def index
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to :root
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.permit(:name, :email)
  end
end
