# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book_library do
    ignore do
      books_count 5
    end
    
    before :create do |library, evalutor|
      evalutor.books_count.times  do
        library.books << create(:book)
      end
    end
  end
end
