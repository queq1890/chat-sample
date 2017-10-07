class MessagesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_messages_group, only: [:index, :create]

  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path
    else
      flash[:alert] = "メッセージを入力してください"
      render 'index'
    end
  end


  private
    def message_params
      params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
    end

    def set_messages_group
      @messages = Message.all
      @group = Group.find(params[:group_id])
    end
end
