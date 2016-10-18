Rails.application.routes.draw do
  root "pages#index"

  resources :users, only: [:show, :index]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users
    end
  end
end
