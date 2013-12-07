class UserBookRelationship < ActiveRecord::Base

  belongs_to :user
  belongs_to :book_library_book_relationship

  state_machine :state, initial: :waiting do
    state :waiting
    state :rejected
    state :in_read
    state :returned

    event :reject do
      transition [:waiting] => :rejected
    end

    event :take do
      transition [:waiting] => :in_read
    end

    event :to_library do
      transition [:in_read] => :returned
    end
  end

end
