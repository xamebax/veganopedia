FactoryGirl.define do
  factory :user do
    username { FactoryGirl.generate :username }
    email { FactoryGirl.generate :email }
    password "password"
  end
end
