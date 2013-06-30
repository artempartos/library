Library::Application.routes.draw do
  scope module: :web do
    get "/404", :to => "web/errors#not_found"
    get "/500", :to => "web/errors#internal_server_error"

    root to: 'welcome#index'

    resource :session, only: [:new, :create, :destroy]
    resources :users, only: [:new, :create]
    resources :books, only: [:index, :show]
    namespace :admin do
      resources :users, only: [:index, :show, :new, :create, :destroy]
      root to: 'welcome#index'
      resources :books, only: [:index, :edit, :show, :new, :create, :destroy] do
        collection do 
          get 'tagged'
        end
      end
    end

    resources :users do
      scope :module => :users do
        resources :comments, only: [:index]
      end
    end

    resources :books do
      scope :module => :books do
        resources :comments
      end
    end
  end

  namespace :api do
    resource :user, only: [:show]
    resource :dashboard, only: [:show]
    resources :books, only: [:index]
    resource :book, only: [:show]
  end

end
