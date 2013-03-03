FactoryGirl.define do
  factory :user do |u|
    u.id 1
    u.username { Faker::Lorem.word }
    u.email { Faker::Internet.email }
    u.password "some pass"
    u.password_confirmation "some pass"
  end
  factory :userShort, class: User do |u|
    u.id 1
    u.username { Faker::Lorem.word }
    u.email { Faker::Internet.email }
    u.password "some"
    u.password_confirmation "some"
  end
end