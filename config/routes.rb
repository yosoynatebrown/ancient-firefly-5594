Rails.application.routes.draw do
  resources :teams, only: [:index]
end
