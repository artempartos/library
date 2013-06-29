class Book < ActiveRecord::Base
  attr_accessible :author, :isbn, :title, :year, :pages

  has_many :comments

  validates :author, presence: true
  validates :isbn, presence: true, uniqueness: true
  validates :title, presence: true
  validates :year, presence: true
  validates :pages, presence: true

end
