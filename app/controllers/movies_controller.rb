class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    if params[:sort_order].nil?
      if params[:ratings].nil?
        @movies = Movie.all
      else
        @movies = Movie.find(:all, :conditions => { :rating => params[:ratings].keys })
      end
    elsif 'by_title' == params[:sort_order]
      @movies = Movie.find(:all, :order => :title)
    elsif 'by_release_date' == params[:sort_order]
      @movies = Movie.find(:all, :order => :release_date)
    end

    @all_ratings = Movie.all_ratings
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

