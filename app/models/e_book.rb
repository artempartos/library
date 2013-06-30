class EBook < ActiveRecord::Base
  attr_accessible :title, :file

  belongs_to :book, inverse_of: :e_book

  mount_uploader :file, ImageUploader

  validates :book, presence: true

  def url_content
    url(:file)
  end
end