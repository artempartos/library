class Web::CompaniesController < Web::ApplicationController

  def index
    query = { s: 'created_at desc' }.merge(params[:q] || {})
    @q = Company.web.ransack(query)
    @companies = @q.result.page(params[:page])
  end

  def show
    @company = Company.find(params[:id])
    render layout: 'layouts/web/companies/application'
  end

  def new
    @company = ::CompanyEditType.new
  end

  def create
    @company = ::CompanyEditType.new params[:company]
    @company.creator = current_user
    if @company.save
      @company.employees << current_user
      @company.create_library
      f(:success)
      redirect_to edit_company_path @company
    else
      f(:error)
      render :new
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    @company = @company.becomes ::CompanyEditType
    if @company.update(params[:company])
      f(:success)
      redirect_to company_path @company
    else
      f(:error)
      render :edit
    end
  end

  def destroy
    company = Company.find(params[:id])
    company.suspend

    f(:success)

    redirect_to companies_path
  end

end
