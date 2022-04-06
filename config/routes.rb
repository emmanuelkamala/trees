Rails.application.routes.draw do
  resources :projects
  resources :donations
  root 'donations#new'
  get 'home', to: 'public#home'
  get 'village-projects', to: 'public#village_projects'
  get 'school-projects', to: 'public#school_projects'
  get 'reforestation-rau-forest', to: 'public#reforestation_rau_forest'
  get 'contact', to: 'public#contact'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
