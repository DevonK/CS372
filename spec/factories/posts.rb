FactoryGirl.define do
  factory :post do |p|
    p.id 1
    p.body { Faker::Lorem.sentence }
    p.user_id 100
    p.topic_id 1000
  end
end