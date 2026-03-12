class HometownsController < ApplicationController
  def index
    matching_hometowns = Hometown.all

    @list_of_hometowns = matching_hometowns.order({ :created_at => :desc })

    render({ :template => "hometown_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_hometowns = Hometown.where({ :id => the_id })

    @the_hometown = matching_hometowns.at(0)

    render({ :template => "hometown_templates/show" })
  end

  def create
    the_hometown = Hometown.new
    the_hometown.name = params.fetch("query_name")

    if the_hometown.valid?
      the_hometown.save
      redirect_to("/hometowns", { :notice => "Hometown created successfully." })
    else
      redirect_to("/hometowns", { :alert => the_hometown.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_hometown = Hometown.where({ :id => the_id }).at(0)

    the_hometown.name = params.fetch("query_name")

    if the_hometown.valid?
      the_hometown.save
      redirect_to("/hometowns/#{the_hometown.id}", { :notice => "Hometown updated successfully." } )
    else
      redirect_to("/hometowns/#{the_hometown.id}", { :alert => the_hometown.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_hometown = Hometown.where({ :id => the_id }).at(0)

    the_hometown.destroy

    redirect_to("/hometowns", { :notice => "Hometown deleted successfully." } )
  end
end
