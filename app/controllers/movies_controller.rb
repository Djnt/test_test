class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:update]

  def show
    @movie = Movie.find(params[:id])
  end

  def update
    movie = Movie.find(params[:id])
    Rate.create(value: params[:rate], movie: movie, user: current_user)
    movie.reload
    render json: {raiting: movie.raiting}, status: 200
  end
end
