require 'rails_helper'

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
    context 'when user does sign_in' do
      before do
        login_user user
      end
    end

    context 'when user does not sign_in' do
    end
  end
end
