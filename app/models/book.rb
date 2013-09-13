class Book < ActiveRecord::Base
  include Authority::Abilities

end
