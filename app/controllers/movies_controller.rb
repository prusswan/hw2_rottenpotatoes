class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index

    query_base = Movie

    session[:ratings] = params[:ratings] if params[:ratings]
    if session[:ratings]
      query_base = query_base.scoped(:conditions => { :rating => session[:ratings].keys })
    end

    session[:sort_order] = params[:sort_order] if params[:sort_order]
    if session[:sort_order]
      query_base = query_base.scoped(:order => session[:sort_order])
    end

    @movies = query_base.all

    @all_ratings = Movie.all_ratings

    if session[:ratings]
      @selected_ratings = session[:ratings]
    else
      @selected_ratings = {}
    end
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end

