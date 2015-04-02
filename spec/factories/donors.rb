FactoryGirl.define do
  factory :donor do
    sequence(:email) { |n| "josh#{n}@example.com" }
    password "password"
  end

end
