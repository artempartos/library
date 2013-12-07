require 'test_helper'

class Web::Companies::EmployeesControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    sign_in(@user)

    @company = create :company
  end

  test "should get index" do
    get :index, company_id: @company
    assert_response :success
  end

  test "should create" do
    users = []

    (0..5).each do |i|
      users << create(:user)
    end

    email_string = users.map(&:email).join(', ')

    post :create, company_id: @company.id, users: { emails: email_string }
    assert_response :redirect

    @company.reload

    uu = users.map(&:id)
    uc = @company.employees.map(&:id)
    r = uu && uc

    assert { uu == r }
  end

  test "should delete destroy" do

  end
end
