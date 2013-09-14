require 'test_helper'

class Web::BooksControllerTest < ActionController::TestCase

  setup do
    @attrs = attributes_for :book
    @book = create :book
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should edit book" do
    get :edit, id: @book.id
    assert_response :success
  end

  test "should create book" do
    post :create, book: @attrs
    assert_response :redirect

    created_book = Book.where(@attrs.extract(:name)).first
    assert { created_book }
  end

  test "should show book" do
    get :show, id: @book.id
    assert_response :success
  end

  test "should update book" do
    patch :update, id: @book.id, book: @attrs
    assert_response :redirect

    @book.reload

    assert { @attrs[:name] == @book.name }
  end
end
