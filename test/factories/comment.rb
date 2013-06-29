FactoryGirl.define do
  factory :comment do
    text    { generate :text }
    book_id { generate :id }
    user_id { generate :id }
  end
end
