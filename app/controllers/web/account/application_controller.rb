class Web::Account::ApplicationController < Web::ApplicationController
  before_filter :authenticate_user!

  add_breadcrumb :index, :account_root
end
