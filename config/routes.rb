
Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraint.new(version: 1) do
      resources :users

    end
    scope module: :v2, constraints: ApiConstraint.new(version: 2, default: :true) do
      resources :users
      post 'login'  => 'users#token'
    end
  end


  # Catch-all Rails route for arbitrary Ember routes
  get '*path', to: 'home#index'
end
