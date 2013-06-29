class Comment < ActiveRecord::Base
  attr_accessible :text, :book_id, :user_id

  belongs_to :user
  belongs_to :book

  validates :text, :presence => true

end
