require 'rails_helper'

describe Message do
  describe '#create' do
    it "is valid with a body" do
      user = create(:user)
      group = create(:group)
      message = build(:message, image: nil, user_id: user.id, group_id: group.id)
      expect(message).to be_valid
    end

    it "is valid with an image" do
      user = create(:user)
      group = create(:group)
      message = build(:message, body: nil, user_id: user.id, group_id: group.id)
      expect(message).to be_valid
    end

    it "is valid with an image and a body" do
      user = create(:user)
      group = create(:group)
      message = build(:message, user_id: user.id, group_id: group.id)
      expect(message).to be_valid
    end

    it "is invalid without a body" do
    end

    it "is invalid without a group_id" do
    end

    it "is invalid without a user_id" do
    end
  end
end
