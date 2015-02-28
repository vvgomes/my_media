FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
    password_confirmation { password }
  end

  factory :media_item do
    url Faker::Internet.url
    kind 1
  end
end


