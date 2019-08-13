ROUTER.register do |router|
  router.root 'main#index'

  router.get '/posts', to: 'posts#index'
  router.get '/posts/\d+', to: 'posts#show'
  router.get '/posts/new', to: 'posts#new'
  router.post '/posts/create', to: 'posts#create'
end
