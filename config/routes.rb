Rails.application.routes.draw do
  root to: 'home#index'


  # Catch-all Rails route for arbitrary Ember routes
  get '*path', to: 'home#index'
end
