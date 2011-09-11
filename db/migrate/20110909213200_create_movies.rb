class CreateMovies < ActiveRecord::Migration
  def self.up
    create_table :movies do |t|
      t.string :title
      t.string :rating
      t.text :description
      t.datetime :release_date
      t.timestamps
    end
  end

  def self.down
    drop_table :movies
  end
end
