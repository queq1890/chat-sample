require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #index' do
    before do
      login_user user
    end
  end

  describe 'POST #create' do
  end
end
