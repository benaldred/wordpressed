Wordpressed::Engine.routes.draw do
  resources :posts
  root :to => "posts#index"


  # post show
  match '/:year/:month/:day/:id' => 'posts#show', constraints: { year: /[0-9]{4}/, month: /[0-9]{2}/, day: /[0-9]{2}/}

  # archives
  match '/:year/:month' => 'posts#month', constraints: Wordpressed::Constraints::MonthRoute
  match '/:year' => 'posts#year', constraints: { year: /[0-9]{4}/}

  #search
  #/?s=foo

  #tags
  #/tags/:tag
end
