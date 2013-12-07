#encoding: utf-8

class Web::Account::Libraries::BooksController < Web::Account::Libraries::ApplicationController
  def create
    @book = Book.find(params[:book_id])
    resource_library.books << @book if !resource_library.books.include?(@book)
    redirect_to account_library_path
  end

  def edit
    @book = resource_library.book_library_book_relationships.find_by(book_id: params[:id])
    @user_relation = @book.reader_relation
    if @user_relation
      @reader =  @user_relation.user
    end
    @watchers = @book.watchers
    @watchers += [@reader] if @reader && !@watchers.include?(@reader)
    @watchers.uniq

    @book = @book.becomes(::Account::Library::BookEditType)
  end

  def update
    #raise params.inspect
    @book = resource_library.book_library_book_relationships.find_by(book_id: params[:id])
    @book = @book.becomes(::Account::Library::BookEditType)

    data = params[:book_library_book_relationship]
    case data[:state_event]
    when ""
    when "return"
      @user_relation = resource_library.book_library_book_relationships.find_by(book_id: params[:id]).reader_relation

      if @user_relation
        @user_relation.to_library
        @user_relation.readed_at = DateTime.now
        @user_relation.save
      end

      params[:book_library_book_relationship][:reader_relation_id] = nil
      if @book.watchers.any?
        user = @book.watchers.first
        b = Book.find(params[:id])
        UserMailer.avaliable_book(user, b, resource_library).deliver
        phone = user.phone
      end

    when "borrow"
      #raise params.inspect
      if data[:reader_relation_id].blank?
        f(:error)
        render :edit
        return
      end

      #p resource_library.subscribers.inspect
      @user_relation = resource_library.subscribers.where(user_id: data[:reader_relation_id],\
                                                          book_library_book_relationship_id: resource_library.book_library_book_relationships.find_by(book_id: params[:id])).last
      if @user_relation
        @user_relation.take
        # TODO.Add field "Started_at"
        @user_relation.save

      params[:book_library_book_relationship][:reader_relation_id] = @user_relation.id
      end
    end

    if @book.update(params[:book_library_book_relationship])
      f(:success)
      redirect_to_back_or account_library_path
    else
      f(:error)
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    #TODO Отоспаться и разобраться почему не работает destroy
    resource_library.books.delete(book)
    redirect_to_back_or account_library_path
  end
end
