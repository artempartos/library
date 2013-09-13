class Book < ActiveRecord::Base



  state_machine :state, initial: :draft do
    state :published
    state :unpublished
    state :draft

    event :publish do
      transition [:unpublished, :draft] => :published
    end
    event :unpublish do
      transition [:published, :draft] => :unpublished
    end
    event :to_draft do
      transition [:published, :unpublished] => :draft
    end
  end

  include BookRepository

end
