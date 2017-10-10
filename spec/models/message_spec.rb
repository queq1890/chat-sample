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

    it "is invalid without an image and a body" do
      user = create(:user)
      group = create(:group)
      message = build(:message, image: nil, body: nil, user_id: user.id, group_id: group.id)
      message.valid?
      expect(message.errors[:image]).to include("を入力してください")
    end

    it "is invalid without a group_id" do
      user = create(:user)
      group = create(:group)
      message = build(:message, user_id: user.id, group_id: nil)
      message.valid?
      expect(message.errors[:group]).to include("を入力してください")
    end

    it "is invalid without a user_id" do
      user = create(:user)
      group = create(:group)
      message = build(:message, user_id: nil, group_id: group.id)
      message.valid?
      expect(message.errors[:user]).to include("を入力してください")
    end
  end
end
