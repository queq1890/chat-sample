require 'rails_helper'
require 'pry'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:message) { build(:message) }

  describe 'GET #index' do
    context 'when user does sign_in' do
      before do
        login_user user
        get :index, params: { group_id: user.groups.first.id }
      end

      it "assigns the requested message to @message" do
        blank_message = Message.new
        expect(assigns(:message).attributes).to eq(blank_message.attributes)
      end

      it "assigns the requested group to @group" do
        expect(assigns(:group)).to eq(user.groups.first)
      end

      it "renders index" do
        expect(response).to render_template :index
      end
    end

    context 'when user does not sign_in' do
      it "redirects to new_user_session_path" do
        get :index, params: { group_id: user.groups.first.id }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'POST #create' do
    context 'when user does sign_in && @message successfully saved' do
      before do
        login_user user
      end

      it "successfully saved @message" do
        expect do
          post :create, params: { group_id: user.groups.first.id, message: attributes_for(:message) }
        end.to change(Message, :count).by(1)
      end

      it "redirects to group_messages_path" do
        post :create, params: { group_id: user.groups.first.id, message: attributes_for(:message) }
        expect(response).to redirect_to group_messages_path(user.groups.first.id)
      end
    end

    context 'when user does sign_in && @message failed to save' do
      before do
        login_user user
      end

      it "failed to save @message" do
        expect do
          post :create, params: { group_id: user.groups.first.id, message: attributes_for(:message, body: nil, image: nil) }
        end.to change(Message, :count).by(0)
      end

      it "renders index" do
        post :create, params: { group_id: user.groups.first.id, message: attributes_for(:message, body: nil, image: nil) }
        expect(response).to render_template :index
      end
    end

    context 'when user does not sign_in' do
      it "redirects to new_user_session_path" do
        post :create, params: { group_id: user.groups.first.id, message: attributes_for(:message) }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
