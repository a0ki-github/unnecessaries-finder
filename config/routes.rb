Rails.application.routes.draw do
  get '/terms_of_use', to: 'static_pages#terms_of_use'
  namespace :admin do
    resources :items
  end
  resources :uploads, only: %i(new create show)
  root 'uploads#new'
end
