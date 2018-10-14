FactoryGirl.define do
  factory :machine do
    sequence(:name) { |i| "CPU#{i}" }
    id 99
    sequence(:serialNumber) { |i| "SERIAL#{i}" }
  end
end 