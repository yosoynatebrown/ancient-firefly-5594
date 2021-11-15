Rails.application.routes.draw do
  resources :teams,             only: [:index]
  resources :competitions,      only: [:show]
  resources :team_competitions, only: [:create]

  post '/competitions/:id/teams', to: 'team_competitions#create'
end
