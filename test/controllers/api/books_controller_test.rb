require 'test_helper'

class Api::BooksControllerTest < ActionController::TestCase

  setup do
    @book = create :book
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
  end

end
