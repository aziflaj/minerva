ROUTER.register do |router|
  router.root 'main#index'

  router.get '/posts', to: 'posts#index'
  router.get '/posts/:id', to: 'posts#show'
  router.get '/posts/new', to: 'posts#new'
  router.post '/posts', to: 'posts#create'

  router.get '/posts/:id/edit', to: 'posts#edit'
  router.put '/posts/:id', to: 'posts#update'
end
