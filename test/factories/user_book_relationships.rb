# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_book_relationship do
    user
    book_library_book_relationship
  end
end
