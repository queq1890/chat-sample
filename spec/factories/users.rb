FactoryGirl.define do
  pass =  Faker::Internet.password(6)

  factory :user do
    name                  Faker::Internet.user_name
    email                 Faker::Internet.email
    password              pass
    password_confirmation pass

    after(:create) do |user|
      user.groups << create(:group)
    end
  end
end
