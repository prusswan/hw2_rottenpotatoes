class Movie < ActiveRecord::Base

  class InvalidKeyError < StandardError ; end

  def self.api_key
    'cc4b67c52acb514bdf4931f7cedfd12b'
  end

  def self.find_in_tmdb(string)
    Tmdb.api_key = self.api_key
    begin
      TmdbMovie.find(:title => string)
    rescue ArgumentError, RuntimeError
      raise Movie::InvalidKeyError
    end      
  end

  # rest of file elided for brevity
end
