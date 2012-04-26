# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    name { FactoryGirl.generate :product_name }
    company "Vegan ACME"
    shops "Vegan store"
    ingriedients "Oil, flour, salt"
    user nil #{ FactoryGirl.create :user }
    price "9.99"
  end
end
