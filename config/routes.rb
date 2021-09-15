Rails.application.routes.draw do
  namespace :admin do
    resources :items
  end
  resources :uploads, only: %i(new create show)
  root 'uploads#new'
end
