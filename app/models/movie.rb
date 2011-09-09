class Movie < ActiveRecord::Base

  @@ratings = ['G', 'PG', 'PG-13', 'R', 'NC-17']
  cattr_accessor :ratings

  validates_presence_of :title
  validates_length_of :description, :minimum => 10
  validates_uniqueness_of :title, :message => "already exists in the database"
  validates_inclusion_of :rating, :in => Movie.ratings, :message => "is not a valid rating"
  
  # Returns a formatted version of the date:
  def release_date
    self.released_on.strftime('%B %d, %Y') if self.released_on
  end
  
  def self.required_age_for(rating)
    {
      "G"     =>  0,
      "PG"    =>  0,
      "PG-13" =>  13,
      "R"     =>  17,
      "NC-17" =>  17
    }[rating]
  end
  
  def appropriate_for_birthdate?(birthdate)
    latest_acceptable_time = Movie.required_age_for(self.rating).years.ago
    birthdate <= latest_acceptable_time
  end
  
  def self.find_all_appropriate_for_birthdate(birthdate)
    Movie.all.select do |movie|
      movie.appropriate_for_birthdate?(birthdate)
    end
  end

end
