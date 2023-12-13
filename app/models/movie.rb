class Movie < ApplicationRecord
  validates :title, :director, :release_year, :genre, :description, presence: true
end
