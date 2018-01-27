FactoryGirl.define do
  factory :user do |f|
    f.sequence(:email) {|n| "user#{n}@blow.com" }
    f.password "123456"
  end
    
  factory :feed do |f|
    f.name { Faker::Lorem.sentence }
    f.url { Faker::Internet.url }
    f.description { Faker::Lorem.paragraph }
    user
  end
end
