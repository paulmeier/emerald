FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "testuser#{i}@example.com" }
    id 99
    sequence(:password) { |i| "testpass#{i}" }
  end
end