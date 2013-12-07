class Web::Account::Libraries::ApplicationController < Web::Account::ApplicationController
  def resource_library
    current_user.current_library
  end
end
