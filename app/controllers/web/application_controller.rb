class Web::ApplicationController < ApplicationController

  protect_from_forgery with: :exception

  def redirect_to_back_or(default)
    redirect_to params[:from] || default
  end

  private
  def resource_book
    Book.find(params[:id])
  end

end
