ManualBlog::Application.routes.draw do
  
  # get "blog/index"
  # match 'blog/index' => 'blog#index', :via => :get
  
  root :to => 'blog#index'
  match 'blog/:id' => 'blog#show', :as => 'blog', :via => :get
  match 'blog/a/:level' => 'blog#a', :as => 'awesomeness', :via => :get

  resources :comments

  # All of the following routes could be automatically
  # generated for us by including:
  # resources :posts
  
  # When Rails sees a GET request to /posts it should
  # execute the index action (method) of the posts controller
  match 'posts' => 'posts#index', :via => :get, :as => 'posts'
 
  match 'posts' => 'posts#create', :via => :post
  match 'posts/new' => 'posts#new', :via => :get, :as => 'new_post'
  
  match 'posts/:id' => 'posts#show', :as => 'post', :via => :get
  
  match 'posts/:id' => 'posts#destroy', :via => :delete
  
  match 'posts/:id' => 'posts#update', :via => :put
  match 'posts/:id/edit' => 'posts#edit', :as => 'edit_post', :via => :get
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

end
