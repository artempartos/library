class Web::Companies::EmployeesController < Web::Companies::ApplicationController

  def index
    @employees = resource_company.employees
  end

  def destroy
    user = resource_company.user_company_relationships.find_by(user_id: params[:id])
    user.destroy
    redirect_to company_employees_path resource_company
  end

  def create
    emails = params[:users][:emails].delete(' ').split(',')
    emails.each do |email|
      user = User.without_company(resource_company).find_by(email: email)
      resource_company.employees << user if user
    end
    redirect_to company_employees_path resource_company
  end

end
