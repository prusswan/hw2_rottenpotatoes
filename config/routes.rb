ActionController::Routing::Routes.draw do |map|

  # create RESTful routes for the Movie resource.
  map.resources :movies

  # The root of the site ('/') is an alias for 'list all movies'.
  map.root :movies

  # See how all your routes lay out with "rake routes"

end
