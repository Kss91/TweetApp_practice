Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"

  post "logout" => "users#logout"
  post "login" => "users#login"
  get "login" => "users#login_form"
  
  get "users/:id/likes" => "users#likes"
  post "users/:id/update" => "users#update"
  post "users/:id/destroy" => "users#destroy"
  get "users/:id/delete" => "users#delete"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  get 'users/index' => "users#index"
  get "users/:id/edit" => "users#edit"
  get "users/:id/edit" => "users#edit"
  get "users/:id" => "users#show"

  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/:id" => "posts#show"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"

  get "/" => "home#top"
  get "about" => "home#about"

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
end
