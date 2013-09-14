class Web::CompaniesController < Web::ApplicationController

  def index
    query = { s: 'created_at desc' }.merge(params[:q] || {})
    @q = Company.web.ransack(query)
    @companies = @q.result.page(params[:page])
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = ::Company::CompanyEditType.new
  end

  def create
    @company = ::Company::CompanyEditType.new params[:company]
    #TODO @company.creator = current_user

    if @company.save
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
    @company = @company.becomes ::Company::CompanyEditType
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

    redirect_to
  end

end
