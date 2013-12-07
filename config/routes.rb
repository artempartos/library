Library::Application.routes.draw do
  scope module: :web do
    root to: "welcome#index"
    resources :libraries, only: [:index]
    resource :analytics, only: [:show]
    resources :companies do
      scope module: :companies do
        resources :employees, only: [:index, :destroy, :create]
      end
    end
    resources :books do
      scope module: :books do
        resources :comments
      end
    end

    resources :users, only: [:new, :create, :index, :show] do
      member do
        get :confirm
      end

    end
    resource :session, only: [:new, :create, :destroy]
    namespace :account do
      root to: "welcome#index"
      resource :profile, only: [:edit, :update]
      resource :password, only: [:edit, :update]
      resource :library, only: [:show, :create, :update, :destroy] do
        scope module: :libraries do
          resources :books, only: [:create, :edit, :update, :destroy]
          resources :subscriptions, only: [:index, :create, :edit, :update, :destroy]
        end
      end
      resource :queue, only: [:show]
    end
    resource :remind_password, only: [:new, :create]
  end

  namespace :api do
    resources :books
  end

end
