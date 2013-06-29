require 'test_helper'

class Web::Users::CommentsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @params = {user_id: @user.id}
    @comment = create :comment
  end

  test "should get index" do
    get :index, @params
    assert_response :success
  end
end
