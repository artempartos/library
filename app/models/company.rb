class Company < ActiveRecord::Base
  attr_accessible :name, :user_id

  has_many :users, conditions: { admin: false }
  belongs_to :admin, class_name:'User', conditions: { admin: true }
  has_many :books

  validates :name, presence: true, uniqueness: true
end
