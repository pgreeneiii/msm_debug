class MoviesController < ApplicationController

   #Index = Landing Page for movies
  def index
    @movies = Movie.all
  end

  #Show detailed page for single movie
  def show
   #  Parameters > :id = "###"
    id = params[:id]
    @movie = Movie.find(id)
    render("/movies/show.html.erb")
  end

  #Form to create a new movie
  def new_form
     render("/movies/new_form.html.erb")
  end
  #Back-end of creating a new movie
  def create_row
     #Parameters > :id = "###"
     # =>          :title = "text"
     # =>          :year = "####"
     # =>          :duration = "text"
     # =>          :description = "text"
     # =>          :image_url = "URL"
     # =>          :director_id = "###"

    movie = Movie.new
    movie.title = params[:title]
    movie.year = params[:year]
    movie.duration = params[:duration]
    movie.description = params[:description]
    movie.image_url = params[:image_url]
    movie.director_id = params[:director_id]

    movie.save

    redirect_to("/movies/#{movie.id}")
  end

  #Form to edit an existing movie
  def edit_form
    @movie = Movie.find(params[:id])
    render("/movies/edit_form.html.erb")
  end
  #Backend to edit an existing movie
  def update_row
     #Parameters > :id = "###"
     # =>          :title = "text"
     # =>          :year = "####"
     # =>          :duration = "text"
     # =>          :description = "text"
     # =>          :image_url = "URL"
     # =>          :director_id = "###"

    movie = Movie.find(params[:id])

    movie.title = params[:title]
    movie.year = params[:year]
    movie.duration = params[:duration]
    movie.description = params[:description]
    movie.image_url = params[:image_url]
    movie.director_id = params[:director_id]

    movie.save

    redirect_to("/movies/#{params[:id]}")
  end

  #Remove a movie from the database
  def destroy
    @movie = Movie.find(params[:id])

    @movie.destroy

    render("/movies/destroy.html.erb")
  end

end
