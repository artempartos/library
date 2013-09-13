# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    name "MyString"
    author "MyString"
    description "MyText"
    book_cover "MyString"
    year 1
    isbn "MyString"
    state "MyString"
  end
end
