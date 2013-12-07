require 'test_helper'

class Web::CompaniesControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    sign_in @user

    @company = create :company
    @attrs = attributes_for :company
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get show' do
    get :show, id: @company.id
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @company.id
    assert_response :success
  end

  test 'should create' do
    post :create, company: @attrs
    assert_response :redirect

    company = Company.where(@attrs.extract(:name)).first
    assert { company }
  end


  test 'should pach update' do
    patch :update, id: @company.id, company: @attrs
    assert_response :redirect

    @company.reload
    assert { @attrs[:name] == @company.name }
  end

  test 'should delete destroy' do
    get :destroy, id: @company.id
    assert_response :redirect

    @company.reload
    assert { @company.suspended? }
  end

end
