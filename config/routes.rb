Library::Application.routes.draw do

  scope :module => :web do
    resources :books
  end

end
