require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @attrs = attributes_for :user
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

  test 'should create ' do
    post :create, user: @attrs
    assert_response :redirect

    user = User.find_by_email(@attrs[:email])
    assert_not_nil user
  end
end
