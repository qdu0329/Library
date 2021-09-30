Rails.application.routes.draw do
  get 'welcome/index'
  get 'books/admin'
  get 'books/patron'
  get 'books/review'
  get '/checkout/', to: "books#checkout"


  resources :admin_searches
  resources :patron_searches
  # post  'adminsearches/new'
  # post  'patronsearch/new'

  resources	:books do
    resources :reviews
  end

  root 'welcome#index'

  #get 'books/search'
  #post 'books/search'
  #get 'books/result'

  get '/reviews/new', to: 'reviews#new'
end
