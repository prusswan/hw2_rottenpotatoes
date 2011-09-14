Rottenpotatoes::Application.routes.draw do
  # create RESTful routes for the Movie resource.
  resources :movies

  # The root of the site ('/') is an alias for 'list all movies'.
  root :to => 'movies#index'

  # Otherwise, assume the route names the controller and action
  match ':controller/:action'

  # See how all your routes lay out with "rake routes"
end
