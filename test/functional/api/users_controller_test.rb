require 'test_helper'

class Api::UsersControllerTest < ActionController::TestCase

  setup do
    @user = create :user
    sign_in @user
  end

  test 'should get show' do
    get :show, format: :json
  end

end
