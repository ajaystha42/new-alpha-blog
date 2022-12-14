Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'home#index'
  get 'about' => 'home#about'

  resources :articles
  delete 'articles/:id/delete' => 'articles#destroy', as: 'articles_delete'
  get '/articles/:id/delete' => 'articles#destroy'
end
