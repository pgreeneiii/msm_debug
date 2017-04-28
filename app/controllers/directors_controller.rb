class DirectorsController < ApplicationController
  def index
    @directors = Director.all
    render("/directors/index.html.erb")
  end

  def show
    @director = Director.find(params[:id])
    render("/directors/show.html.erb")
  end

  def new_form
     render("/directors/new_form.html.erb")
  end

  def create_row
     #Parameters > :dob = "Month DD, YYYY"
     # =>          :name = "text"
     # =>          :bio = "text"
     # =>          :image_url = "URL"

    director = Director.new
    director.dob = params[:dob]
    director.name = params[:name]
    director.bio = params[:bio]
    director.image_url = params[:image_url]

    director.save

    redirect_to("/directors/#{director.id}")
  end

  def edit_form
    @director = Director.find(params[:id])
    render("/directors/edit_form.html.erb")
  end

  def update_row
     #Parameters > :id = "###"
     # =>          :dob = "Month DD, YYYY"
     # =>          :name = "text"
     # =>          :bio = "text"
     # =>          :image_url = "URL"

    director = Director.find(params[:id])

    director.dob = params[:the_dob]
    director.name = params[:the_name]
    director.bio = params[:the_bio]
    director.image_url = params[:the_image_url]

    director.save

    redirect_to("/directors/#{params[:id]}")
  end

  def destroy
     #Parameters > :id = "###"
    @director = Director.find(params[:id])

    @director.destroy

    render("/directors/destroy.html.erb")
  end
end
