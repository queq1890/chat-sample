FactoryGirl.define do
  factory :message do
    body "テスト用メッセージ"
    user_id "1"
    group_id "1"
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'brands', 'logos', 'logo_image.jpg'), 'image/jpeg') }
  end
end
