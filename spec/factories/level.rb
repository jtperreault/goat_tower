FactoryGirl.define do
  factory :level do
    sequence(:position) { |n| n }
  end
end
