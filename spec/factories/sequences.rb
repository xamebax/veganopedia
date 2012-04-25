FactoryGirl.define do
  sequence(:email) { |n| "email_#{n}@factory.com" }
  sequence(:username) { |n| "name_#{n}" }
  sequence(:product_name) { |n| "Product #{n}" }
end
