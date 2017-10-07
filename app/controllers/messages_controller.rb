class MessagesController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @messages = Message.all
    @message = Message.new
    @group = Group.find(params[:group_id])
  end

  def create
    @message = Message.new(message_params)
    @message.save
    redirect_to group_messages_path
  end


  private
    def message_params
      params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
    end
end
