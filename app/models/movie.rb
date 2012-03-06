class Movie < ActiveRecord::Base

  class << self
    def all_ratings
      self.find(:all, select: :rating).map(&:rating).uniq.sort
    end
  end

end

