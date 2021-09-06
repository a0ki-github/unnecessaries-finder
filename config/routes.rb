Rails.application.routes.draw do
  resources :uploads, only: %i(new create show)
end
