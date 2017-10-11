require 'rails_helper'
require 'pry-rails'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:message) { build(:message) }

  describe 'GET #index' do
    context 'when user does sign_in' do
      before do
        login_user user
      end

      it "assigns the requested message to @message" do
        get :index, params: { group_id: group }
        expect(assigns(:message).attributes).to eq(blank_message.attributes)
      end

      it "assigns the requested message to @group" do
      end

      it "renders the :index template" do
      end
    end

    context 'when user does not sign_in' do
      it "redirects to /users/sign_in" do
      end
    end
  end

  describe 'POST #create' do
    context 'when user does sign_in && @message successfully saved' do
      before do
        login_user user
      end

      it "successfully saved @message" do
      end

      it "redirects to group_messages_path" do
      end
    end

    context 'when user does sign_in && @message failed to save' do
      before do
        login_user user
      end

      it "failed to save @message" do
      end

      it "renders a view of messages/index" do
      end
    end

    context 'when user does not sign_in' do
      it "redirects to /users/sign_in" do
      end
    end
  end
end
