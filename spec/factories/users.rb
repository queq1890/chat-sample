FactoryGirl.define do
  pass =  password Faker::Internet.password(6)

  factory :user do
    name                  Faker::Internet.user_name
    email                 Faker::Internet.email
    password              pass
    password_confirmation pass
  end
end
