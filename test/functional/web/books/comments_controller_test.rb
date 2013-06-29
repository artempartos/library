require 'test_helper'

class Web::Books::CommentsControllerTest < ActionController::TestCase
  setup do
    @params = attributes_for :comment
    @book = create :book
    @params[:book_id] = @book.id

    @request.env['HTTP_REFERER'] = root_path
  end

  test "should create comment" do
    post :create, comment: @params, book_id: @book.id
    assert_response :redirect

    comment = Comment.find_by_text(@params[:text])
    assert_not_nil comment
  end

  test "should get index" do
    get :index, @params
    assert_response :success
  end
end

