FactoryGirl.define do
  factory :message do
    body Faker::ChuckNorris.fact
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'test.jpeg'), 'spec/fixtures/jpeg') }
    user
    group
  end
end
