Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  match '/users/:id', to: 'users#show', via: 'get', as: 'profile'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "about"  => "pages#about"
  get "test" => "pages#test"
  # Defines the root path route ("/")
  # root "posts#index"

  resources :companies, only: [:index, :show]
  resources :jobs, only: [:index, :show, :create] do
    resources :job_applications, only: [:create]
  end
  resources :job_applications, only: [:index, :show]

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
