FactoryGirl.define do
  factory :recipient do
    sequence(:email) { |n| "mishka#{n}@example.com" }
    password "password"
  end

end
