Library::Application.routes.draw do
  scope module: :web do
    root to: "welcome#index"

    resource :session, only: [:new, :create, :destroy]
  end


end
