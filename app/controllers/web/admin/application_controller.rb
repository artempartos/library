class Web::Admin::ApplicationController < Web::ApplicationController
  before_filter :authenticate_admin!

  skip_before_filter :authenticate_user!
end
