class MessagesController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @groups = Group.all
  end
end
