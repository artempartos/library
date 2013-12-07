module ApplicationTypeWithoutActiveRecord
  extend ActiveSupport::Concern

  included do
    include ActiveModel::Validations
    include ActiveModel::Conversion
    include ActiveModel::Translation
    include Virtus
  end

  def persisted?
    false
  end

end
