class Movie < ActiveRecord::Base

  @@ratings_with_ages = {
    'G' => 0,
    'PG' => 0,
    'PG-13' => 13,
    'R' => 17,
    'NC-17' => 17
  }
  @@ratings = @@ratings_with_ages.keys
  cattr_reader :ratings

  validates_presence_of :title
  validates_length_of :description, :minimum => 10
  validates_uniqueness_of :title, :message => "already exists in the database"
  validates_inclusion_of :rating, :in => Movie.ratings, :message => "is not a valid rating"
  
end
