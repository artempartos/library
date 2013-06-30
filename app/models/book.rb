class Book < ActiveRecord::Base
  attr_accessible :author, :isbn, :title, :year, :pages, :image, :image_attributes
  has_many :comments, dependent: :destroy, inverse_of: :book
  has_one :image, dependent: :destroy, inverse_of: :book
  include BookRepository

  belongs_to :holder, class_name: User

  validates :author, presence: true
  validates :isbn, presence: true, uniqueness: true
  validates :title, presence: true
  validates :year, presence: true
  validates :pages, presence: true

  accepts_nested_attributes_for :image, allow_destroy: true, reject_if: :all_blank
  state_machine :state, initial: :free do
    state :free
    state :busy do
      validates :holder, presence: true
    end

    event :rent do
      transition free: :busy
    end

    event :return do
      transition busy: :free
    end
  end

end
