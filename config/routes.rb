Library::Application.routes.draw do
  scope module: :web do
    get "/404", :to => "web/errors#not_found"
    get "/500", :to => "web/errors#internal_server_error"

    root to: 'welcome#index'

    resource :session, only: [:new, :create, :destroy]
    resources :users, only: [:index, :show, :new, :create]
    resources :books
    namespace :admin do
      root to: 'welcome#index'
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
end
