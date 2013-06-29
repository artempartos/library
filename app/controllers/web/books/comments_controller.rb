class Web::Books::CommentsController < ApplicationController
  def index
    current_book = Book.find(params[:book_id])
    @comments = current_book.comments
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new params[:comment]
    @comment.user_id = current_user
    @comment.book_id = params[:book_id]
    if @comment.save
      redirect_to :back
    else
      render "new"
    end
  end
end
