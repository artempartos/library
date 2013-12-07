class Web::Companies::ApplicationController < Web::ApplicationController

  layout 'layouts/web/companies/application'
  helper_method :resource_company

  private

  def resource_company
    @company = Company.find(params[:company_id])
  end
end
