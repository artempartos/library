class Web::AnalyticsController < Web::ApplicationController

  def show
    @popular_book = Book.group('date(created_at)').size
    @users = User.includes(:book_library_book_relationships).group(:state).count
  end

end