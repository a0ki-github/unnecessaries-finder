Rails.application.routes.draw do
  get '/terms_of_use', to: 'static_pages#terms_of_use'
  get '/privacy_policy', to: 'static_pages#privacy_policy'
  get '/contact', to: 'static_pages#contact'
  namespace :admin do
    resources :items
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
  end
  resources :uploads, only: %i(new create)
  root 'uploads#new'
end
