FactoryGirl.define do
  factory :message do
    body "テスト用メッセージ"
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'test.jpeg'), 'spec/fixtures/jpeg') }
  end
end
