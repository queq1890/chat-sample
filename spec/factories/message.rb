FactoryGirl.define do
  factory :message do
    body Faker::ChuckNorris.fact
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'test.jpeg'), 'spec/fixtures/jpeg') }
    user
    group
    created_at       { Faker::Time.between(5.days.ago, 3.days.ago, :all) }
    updated_at       { Faker::Time.between(2.days.ago, 1.days.ago, :all) }
  end
end
