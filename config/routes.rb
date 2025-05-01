Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    post 'auth/login', to: 'auth#login'
    resource :videos, only: [:create, :index, :show]
  end
end
