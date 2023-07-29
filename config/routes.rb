Rails.application.routes.draw do
  get '/home/top' => "home#top"
  get '/post/index' => "post/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
