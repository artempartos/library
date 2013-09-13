class Company < ActiveRecord::Base
  include Authority::Abilities

  attr_accessor :name, :logo
  mount_uploader :logo, LogoUploader
end
