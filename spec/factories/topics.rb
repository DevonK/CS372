FactoryGirl.define do
  factory :topic do |t|
    t.id 1
    t.title { Faker::Lorem.word }
    t.content { Faker::Lorem.sentence }
    t.user_id 100
  end
end