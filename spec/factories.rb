FactoryGirl.define do
  factory :item do
    name "spoon"
    price 10.00
    description "big spoon"
    quantity 10
    picture_url "http://spoon.com/image.png"
    upc "1234"
  end
  factory :admin, class: User do
    firstname "bob"
    lastname "bob"
    email "bob123@bob.com"
    password "password"
    user_type 1
  end
  factory :user do
    firstname "schmo"
    lastname "bob"
    email "schmo123@bob.com"
    password "password"
    user_type 0
  end
end
