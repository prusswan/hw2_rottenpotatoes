class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  # in movies_controller.rb
  def create
    Movie.create!(params[:movie])
    redirect_to movies_path
  end
  def index
    @movies = Movie.all
  end
  def new
  end
  # in movies_controller.rb

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    redirect_to movie_path(@movie)
  end
  


end
