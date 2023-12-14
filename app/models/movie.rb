class Movie < ApplicationRecord
  validates :title, :director, :release_year, :genre, :description, presence: true

  has_many :reviews, -> { order(id: :desc) }, dependent: :destroy

  def update_rating
    rating_recalculation
    broadcast_replaces
  end

  private

  def rating_recalculation
    update(rating: reviews.average(:rating))
  end

  def broadcast_replaces
    broadcast_replace(target: "movie-full-rating", partial: 'movies/movie_rating')
  end
end
