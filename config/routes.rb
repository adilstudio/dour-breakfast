Rails.application.routes.draw do

  root to: 'pages#home'
  get 'equipes', to: 'equipes#index', as: 'accueil'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :equipes
  resources :joueurs
  get 'equipes/delete(/:id)', to: 'equipes#destroy', as: 'delete'
  get 'joueurs/delete(/:id)', to: 'joueurs#destroy', as: 'deletejoueur'

  # Defines the root path route ("/")
  # root "articles#index"


end
