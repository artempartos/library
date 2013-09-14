class CompanyEditType < Company
  include ApplicationType

  permit :name, :logo, :logo_cache
end
