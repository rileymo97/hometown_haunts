class HauntsController < ApplicationController
  def index
    matching_haunts = Haunt.all

    @list_of_haunts = matching_haunts.order({ :created_at => :desc })

    render({ :template => "haunt_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_haunts = Haunt.where({ :id => the_id })

    @the_haunt = matching_haunts.at(0)

    render({ :template => "haunt_templates/show" })
  end

  def create
    the_haunt = Haunt.new
    the_haunt.hometown_id = params.fetch("query_hometown_id")
    the_haunt.name = params.fetch("query_name")
    the_haunt.category = params.fetch("query_category")
    the_haunt.address = params.fetch("query_address")

    if the_haunt.valid?
      the_haunt.save
      redirect_to("/haunts", { :notice => "Haunt created successfully." })
    else
      redirect_to("/haunts", { :alert => the_haunt.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_haunt = Haunt.where({ :id => the_id }).at(0)

    the_haunt.hometown_id = params.fetch("query_hometown_id")
    the_haunt.name = params.fetch("query_name")
    the_haunt.category = params.fetch("query_category")
    the_haunt.address = params.fetch("query_address")

    if the_haunt.valid?
      the_haunt.save
      redirect_to("/haunts/#{the_haunt.id}", { :notice => "Haunt updated successfully." } )
    else
      redirect_to("/haunts/#{the_haunt.id}", { :alert => the_haunt.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_haunt = Haunt.where({ :id => the_id }).at(0)

    the_haunt.destroy

    redirect_to("/haunts", { :notice => "Haunt deleted successfully." } )
  end
end
