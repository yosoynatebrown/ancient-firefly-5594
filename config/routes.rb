Rails.application.routes.draw do
  resources :teams,             only: [:index]
  resources :competitions,      only: [:show]

  post '/competitions/:id/teams', to: 'team_competitions#create'
end
