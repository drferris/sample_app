FactoryGirl.define do
  factory :user do
    name     "Dave Ferris"
    email    "dave@email.com"
    password "password"
    password_confirmation "password"
  end
end