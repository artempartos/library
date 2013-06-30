class Book < ActiveRecord::Base
  attr_accessible :author, :isbn, :title, :year, :pages, :image, :image_attributes, :e_book, :e_book_attributes

  has_many :comments, dependent: :destroy, inverse_of: :book
  has_one :e_book, dependent: :destroy, inverse_of: :book
  has_one :image, dependent: :destroy, inverse_of: :book

  validates :author, presence: true
  validates :isbn, presence: true, uniqueness: true
  validates :title, presence: true
  validates :year, presence: true
  validates :pages, presence: true

  accepts_nested_attributes_for :e_book, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :image, allow_destroy: true, reject_if: :all_blank
end