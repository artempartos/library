class Web::Books::CommentsController < Web::Books::ApplicationController

  def index
    @comments = resource_book.comments
  end

  def destroy
    comment = resource_book.comments.find(params[:id])
    comment.destroy
    redirect_to book_comments_path resource_book
  end

  def create
    comment = resource_book.comments.build(comment_params)
    comment.user = current_user
    comment.save
    redirect_to book_path resource_book
  end

  def comment_params
    params.require(:comment).permit(:title, :comment, :user_id)
  end

end
