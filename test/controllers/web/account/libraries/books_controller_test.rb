require 'test_helper'

class Web::Account::Libraries::BooksControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    sign_in(@user)

    @library = create :book_library
    @user.library = @library
    @user.save

    @book = @library.books.first
  end

  test "should add book" do
    @book = create :book

    post :create, book_id: @book.id

    assert { !!@user.library.books(true).include?(@book) }
  end

  test "should edit book" do
    get :edit, id: @book.id
    assert_response :success
  end

  test "should not update book" do
    patch :update, id: @book.id, book_library_book_relationship: { state_event: :borrow }
    assert_response :success
  end

  #test "should update book" do
    #patch :update, id: @book.id, book_library_book_relationship: { state_event: :borrow }
    #assert_response :success
  #end

  test "should remove book" do
    delete :destroy, id: @book.id

    @user.reload
    assert { !@user.library.books.include?(@book) }
  end
end
