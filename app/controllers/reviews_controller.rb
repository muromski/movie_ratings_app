# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :find_review, except: :create

  def create
    @review = build_review
    save_review_and_render_partial('show')
  end

  def edit
    render_review_partial('form')
  end

  def update
    update_review_and_render('show')
  end

  def destroy
    destroy_review_and_render_form_partial
  end

  private

  def review_params
    params.require(:review).permit(:movie_id, :rating, :comment)
  end

  def find_review
    @review = Review.find(params[:id])
  end

  def build_review
    review = Review.new(review_params)
    review.user = User.find_by_id(1)
    review
  end

  def save_review_and_render_partial(partial)
    @review.save
    render_review_partial(partial)
  end

  def update_review_and_render(partial)
    @review.update(review_params)
    render_review_partial(partial)
  end

  def destroy_review_and_render_form_partial
    movie_id = @review.movie.id
    @review.destroy
    @review = Review.new(movie_id: movie_id)
    render_review_partial('form')
  end

  def render_review_partial(partial)
    render turbo_stream: turbo_stream.replace(
      'current-user-review',
      partial: "reviews/#{partial}",
      locals: { review: @review }
    )
  end
end
