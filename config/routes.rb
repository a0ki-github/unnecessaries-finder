Rails.application.routes.draw do
  root 'uploads#new'
  resources :uploads, only: %i(new create show)
end
