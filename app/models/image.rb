class Image < ActiveRecord::Base
  attr_accessible :title, :file

  belongs_to :book, inverse_of: :image

  mount_uploader :file, ImageUploader

  validates :book, presence: true

  def url_content
    url(:file)
  end
end