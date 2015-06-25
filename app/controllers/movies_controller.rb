class MoviesController < ApplicationController

  def index

    @movies = Movie.title_search(params[:title]).director_search(params[:director])

    if params[:duration] == "Under 90"
      @movies = @movies.duration_under90_search
    elsif params[:duration] == "Between 90 and 120"
      @movies = Movie.duration_between_90_and_120_search
    elsif params[:duration] == "Over 120"
      @movies = Movie.duration_over120_search
    end

  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  protected

  def movie_params
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes, :poster_image_url, :description, :image
    )
  end

end