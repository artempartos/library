require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase
  setup do
    @user = create :user
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    attrs = attributes_for :user

    post :create, user: attrs
    assert_response :redirect

    user = User.where(attrs.extract(:email)).first

    assert { user }
    assert { user.confirmation_token? }
    assert { user.waiting_confirmation? }
  end

end