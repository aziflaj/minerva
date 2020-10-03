Router.register do
  root 'main#index'

  get '/posts', to: 'posts#index'
  get '/posts/:id', to: 'posts#show'
  get '/posts/new', to: 'posts#new'
  post '/posts', to: 'posts#create'

  get '/posts/:id/edit', to: 'posts#edit'
  put '/posts/:id', to: 'posts#update'
end
