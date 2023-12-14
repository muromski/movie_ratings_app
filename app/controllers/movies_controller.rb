class MoviesController < ApplicationController
  def index
    @movies = Movie.order(title: :asc)
  end

  def show
    @movie = Movie.find(params[:id])

    # we don't have authentication in the scope of this task, so we can mock current user_id as 1
    @current_user_review = Review.find_or_initialize_by(movie_id: @movie.id, user_id: 1)
  end
end
