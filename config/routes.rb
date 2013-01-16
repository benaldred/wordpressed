Wordpressed::Engine.routes.draw do
  resources :posts, only: [:index]
  root :to => "posts#index"

  match '/wordpressed' => 'admin#index', :as => 'admin'
  post "/wordpressed/sync" => 'admin#sync', :as => "sync_blog"


  # post show
  match '/:year/:month/:id' => 'posts#show', constraints: { year: /[0-9]{4}/, month: /[0-9]{2}/}, as: 'post'

  # archives
  match '/:year/:month' => 'posts#month', constraints: Wordpressed::Constraints::MonthRoute, as: 'month_archive'
  match '/:year' => 'posts#year', constraints: { year: /[0-9]{4}/}

  #search
  #/?s=foo

  #tags
  #/tags/:tag
end
