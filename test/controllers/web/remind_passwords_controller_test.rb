require 'test_helper'

class Web::RemindPasswordsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post create" do

    attrs = { email: @user.email }

    post :create, user_password_remind_type: attrs
    assert_response :redirect
  end

end