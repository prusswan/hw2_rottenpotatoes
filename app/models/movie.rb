class Movie < ActiveRecord::Base

  class InvalidKeyError < StandardError ; end

  def self.find_in_tmdb(string)
    TmdbMovie.find(:title => string)
  end

  # rest of file elided for brevity
end
