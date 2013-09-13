class Company < ActiveRecord::Base
  attr_accessor :name, :logo
  mount_uploader :logo, LogoUploader
end
