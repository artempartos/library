class Company::CompanyEditType < Company
  include ApplicationType

  permit :name
end
