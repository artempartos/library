class Web::Users::CommentsController < ApplicationController
  def index
    current_user = User.find(params[:user_id])
    @comments = current_user.comments
  end
end
