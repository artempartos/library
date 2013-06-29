class Book < ActiveRecord::Base
  attr_accessible :author, :isbn, :title, :year, :pages

  has_many :comments
  has_one :image, dependent: :destroy, inverse_of: :book

  validates :author, presence: true
  validates :isbn, presence: true, uniqueness: true
  validates :title, presence: true
  validates :year, presence: true
  validates :pages, presence: true

  accepts_nested_attributes_for :image, allow_destroy: true, reject_if: :all_blank
end