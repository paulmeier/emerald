FactoryGirl.define do
  factory :lpar do
    sequence(:name) { |i| "BOGP#{i}" }
    id 85
    sequence(:mid) { |i| "B#{i}" }
    sequence(:smfid) { |i| "BOG#{i}" }
  end
end