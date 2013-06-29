require 'test_helper'

class Web::Admin::UsersControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @admin = create :admin_user
    @attrs = attributes_for :user
    sign_in @admin
  end

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get show' do
    get :show, id: @user
    assert_response :success
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create user' do
    post :create, user: @attrs
    assert_response :redirect

    user = User.find_by_email(@attrs[:email])
    assert_not_nil user
  end

  test 'should destroy user' do
    delete :destroy, id: @user
    assert_response :redirect

    assert !User.exists?(@user)
  end
end
