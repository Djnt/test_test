class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:update]

  def index
    User.current=current_user  #not the best idea, just a fast workaround for current_user resolving from model
    @movies = Movie.by_category(params[:category]).page(params[:page] || 1).per(10)
    @categories = Category.all

    respond_to do |format|
      format.html
      format.json { render json: {movies: @movies, categories: @categories} }
    end
  end

  def show
    User.current=current_user
    @movie = Movie.find(params[:id])
  end

  def update
    movie = Movie.find(params[:id])
    Rate.create(value: params[:rate], movie: movie, user: current_user)
    movie.reload
    render json: {raiting: movie.raiting}, status: 200
  end
end
