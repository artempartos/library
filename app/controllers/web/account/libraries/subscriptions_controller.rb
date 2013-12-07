class Web::Account::Libraries::SubscriptionsController < Web::Account::Libraries::ApplicationController
  def index
    @subscriptions = current_user.subscriptions
    @wait_books = current_user.wait_books
  end

  def create
    library = resource_library
    book = library.books.find_by(id: params[:book_id])
    if book.present?
      if book.subscribable_by?(current_user)
        ref = library.book_library_book_relationships.find_by(book_id: book)
        if ref.present?
          if current_user.user_book_relationships.create(book_library_book_relationship: ref)
            f(:success)
          else
            f(:error)
          end
        end
      end
    end
    redirect_to account_library_path
  end

  def edit
  end

  def update
  end

  def destroy
    subscription = current_user.user_book_relationships.find_by(id: params[:id])
    if subscription.destroy
      f(:success)
    else
      f(:error)
    end
    redirect_to_back_or account_library_path
  end
end
