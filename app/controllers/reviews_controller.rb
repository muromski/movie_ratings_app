# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :set_review, except: :create

  def create
    @review = build_review
    @review.save
    render_review_partial('show')
  end

  def edit
    render_review_partial('form')
  end

  def update
    @review.update(review_params)
    render_review_partial('show')
  end

  def destroy
    movie_id = @review.movie.id
    @review.destroy
    @review = Review.new(movie_id:)
    render_review_partial('form')
  end

  private

  def review_params
    params.require(:review).permit(:movie_id, :rating, :comment)
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def build_review
    review = Review.new(review_params)
    review.user = current_user
    review
  end

  def render_review_partial(partial)
    render turbo_stream: turbo_stream.replace(
      'current-user-review',
      partial: "reviews/#{partial}",
      locals: { review: @review }
    )
  end
end
