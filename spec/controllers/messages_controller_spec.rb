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
    end

    context 'when user does not sign_in' do
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
