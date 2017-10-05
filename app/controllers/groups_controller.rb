class GroupsController < ApplicationController

  def index
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(create_params)
      if @group.save
        flash[:notice] = "グループを作成しました"
        redirect_to root_path
      else
        render'new'
      end
  end

  def edit
  end

  private
    def create_params
      params.require(:group).permit(:name, user_ids: [])
    end
end
