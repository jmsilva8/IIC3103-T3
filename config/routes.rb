Rails.application.routes.draw do
  root 'star_wars#home'
  get 'star_wars/home'
  get 'star_wars/films'
  get 'films/:id', to: 'star_wars#films'
  get 'star_wars/ships'
  get 'ships/:id', to: 'star_wars#ships'
  get 'star_wars/planets'
  get 'planets/:id', to: 'star_wars#planets'
  get 'star_wars/characters'
  get 'characters/:id', to: 'star_wars#characters'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
