require 'test_helper'

class Web::Admin::WelcomeControllerTest < ActionController::TestCase
  setup do
    @user = create :admin_user
    sign_in(@user)
  end

  test "should get access for admin user" do
    get :index
    assert_response :success
  end
end
