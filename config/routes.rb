Rails.application.routes.draw do
  resources :intros
  resources :projects
  resources :donations
  root 'public#home'
  get 'public/moshi', to: 'public#moshi', as: :moshi
  get 'public/contact', to: 'public#contact', as: :contact
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
