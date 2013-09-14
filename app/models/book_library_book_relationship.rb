class BookLibraryBookRelationship < ActiveRecord::Base

  belongs_to :book_library
  belongs_to :book

  state_machine :state, initial: :available do
    state :available
  end

end
