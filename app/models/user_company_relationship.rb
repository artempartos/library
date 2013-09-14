class UserCompanyRelationship < ActiveRecord::Base
  belongs_to :user
  belongs_to :company

  validates :user,    presence: true
  validates :company, presence: true
end
