# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :movie, counter_cache: true
  belongs_to :user

  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1,
                                                     less_than_or_equal_to: 5 }
  validates :user_id, uniqueness: { scope: :movie_id }

  broadcasts_to ->(review) { review.user }, inserts_by: :prepend, target: 'user-reviews', partial: 'users/review'
  broadcasts_to ->(review) { review.movie }, inserts_by: :prepend, target: 'reviews'

  after_commit -> { movie.update_rating }
end
