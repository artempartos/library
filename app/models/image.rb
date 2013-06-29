class Image < ActiveRecord::Base
  attr_accessible :title, :file

  belongs_to :book, inverse_of: :book

  mount_uploader :file, ImageUploader

  validates :content, presence: true

  def url_content
    url(:file)
  end
end