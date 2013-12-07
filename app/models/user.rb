class User < ActiveRecord::Base
  include Authority::UserAbilities

  has_secure_password validations: false

  has_one :library, as: :librariable, class_name: BookLibrary

  has_many :own_companies,                    dependent: :destroy, foreign_key: :creator_id, class_name: Company
  has_many :user_company_relationships,       dependent: :destroy
  has_many :companies,                        through: :user_company_relationships

  has_many :user_book_relationships,          dependent: :destroy
  has_many :book_library_book_relationships,  through: :user_book_relationships
  has_many :subscriptions,                    -> { where(state: :waiting) }, class_name: UserBookRelationship
  has_many :books,                            through: :book_library_book_relationships

  has_many :read_books,     -> { where(user_book_relationships: { state: :in_read }) },   through: :book_library_book_relationships, source: :book
  has_many :wait_books,     -> { where(user_book_relationships: { state: :waiting }) },   through: :book_library_book_relationships, source: :book
  has_many :rejected_books, -> { where(user_book_relationships: { state: :rejected }) },  through: :book_library_book_relationships, source: :book
  has_many :returned_books, -> { where(user_book_relationships: { state: :returned }) },  through: :book_library_book_relationships, source: :book

  validates :email,           presence: true, uniqueness: true, email: true
  validates :first_name,      presence: true
  validates :last_name,       presence: true
  validates :password_digest, presence: true

  mount_uploader :avatar, AvatarUploader

  state_machine initial: :waiting_confirmation do
    state :waiting_confirmation
    state :banned
    state :active

    event :confirm do
      transition [:waiting_confirmation, :banned] => :active
    end

    event :ban do
      transition [:waiting_confirmation, :active] => :banned
    end

  end

  include UserRepository

  def generate_confirmation_token
    self.confirmation_token = SecureHelper.generate_token
  end

  def generate_reset_password_token
    self.reset_password_token = SecureHelper.generate_token
  end

  def can_reset_password?
    active?
  end

  def guest?
    false
  end

  def to_s
    "#{first_name} #{last_name}"
  end

  def can_interest?(book)
    if books.include?(book)
      if !read_books.include?(book) && !wait_books.include?(book)
        return true
      else
        return false
      end
    else
      return true
    end
  end

  def current_library
    unless library
      create_library!
    end

    tlibrary = own_companies.first.try(:library)

    tlibrary = companies.first.try(:library) unless tlibrary.present?

    tlibrary = library unless tlibrary.present?

    tlibrary
  end
end
