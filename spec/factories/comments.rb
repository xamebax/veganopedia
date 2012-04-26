FactoryGirl.define do
  factory :comment do
    user { FactoryGirl.create(:user) }
    body "Tekst komentarza. Bardzo smaczny produkt. Serdecznie polecam, Jef Costello."
  end
end
