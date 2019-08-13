ROUTER.register do |router|
  # Routing from the Outside In
  #
  # Use the following DSL to dispatch a Controller action when a request comes in.
  #
  # You can specify where to route '/' to with the root method:
  router.root 'pages#welcome'

  # Match a GET /posts request to the PostsController#index action:
  # router.get '/posts', to: 'posts#index'
  # router.get '/posts/new', to: 'posts#new'
  #
  # You can use RegExp to access query params from the URL:
  # router.get '/posts/\d+', to: 'posts#show'
  #
  # Match a POST /posts request to the PostsController#create action:
  # router.post '/posts', to: 'posts#create'
end
