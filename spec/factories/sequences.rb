FactoryGirl.define do
  sequence(:email) { |n| "email_#{n}@factory.com" }
  sequence(:username) { |n| "name_#{n}" }
end
