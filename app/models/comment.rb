class Comment < ActiveRecord::Base
  attr_accessible :text

  belongs_to :user
  belongs_to :book

  validates :text, :presence => true

end
