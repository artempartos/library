FactoryGirl.define do
  factory :book do
    author  { generate :string }
    isbn    { generate :string }
    title   { generate :string }
    year    { generate :year }
    pages   { generate :number }
  end
end
