class GroupsController < ApplicationController

  def index
  end

  def new
    @group = Group.new
  end

  def create
    Group.create(create_params)
  end

  def edit
  end

  private
    def create_params
      params.permit(user_ids: [],name: "")
    end
end
