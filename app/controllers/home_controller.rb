class HomeController < ApplicationController

  def index
    User.current=current_user  #not the best idea, just a fast workaround for current_user resolving from model
    @movies = Movie.by_category(params[:category]).page(params[:page] || 1).per(10)
    @categories = Category.all

    respond_to do |format|
      format.html
      format.json { render json: {movies: @movies, categories: @categories} }
    end
  end

end
