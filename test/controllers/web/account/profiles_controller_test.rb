require 'test_helper'

class Web::Account::ProfilesControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    sign_in(@user)
  end

  test "edit" do
    get :edit
    assert_response :success
  end

  test "update" do
    attrs = attributes_for(:user).extract(:first_name, :last_name)

    patch :update, user: attrs
    assert_response :redirect

    @user.reload

    assert { attrs[:first_name] == @user.first_name }
  end

end
