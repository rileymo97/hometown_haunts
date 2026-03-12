class RecommendationsController < ApplicationController
  def index
    matching_recommendations = Recommendation.all

    @list_of_recommendations = matching_recommendations.order({ :created_at => :desc })

    render({ :template => "recommendation_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_recommendations = Recommendation.where({ :id => the_id })

    @the_recommendation = matching_recommendations.at(0)

    render({ :template => "recommendation_templates/show" })
  end

  def create
    the_recommendation = Recommendation.new
    the_recommendation.specific_recommendations = params.fetch("query_specific_recommendations")
    the_recommendation.user_id = params.fetch("query_user_id")
    the_recommendation.haunt_id = params.fetch("query_haunt_id")
    the_recommendation.appx_times_haunted = params.fetch("query_appx_times_haunted")

    if the_recommendation.valid?
      the_recommendation.save
      redirect_to("/recommendations", { :notice => "Recommendation created successfully." })
    else
      redirect_to("/recommendations", { :alert => the_recommendation.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_recommendation = Recommendation.where({ :id => the_id }).at(0)

    the_recommendation.specific_recommendations = params.fetch("query_specific_recommendations")
    the_recommendation.user_id = params.fetch("query_user_id")
    the_recommendation.haunt_id = params.fetch("query_haunt_id")
    the_recommendation.appx_times_haunted = params.fetch("query_appx_times_haunted")

    if the_recommendation.valid?
      the_recommendation.save
      redirect_to("/recommendations/#{the_recommendation.id}", { :notice => "Recommendation updated successfully." } )
    else
      redirect_to("/recommendations/#{the_recommendation.id}", { :alert => the_recommendation.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_recommendation = Recommendation.where({ :id => the_id }).at(0)

    the_recommendation.destroy

    redirect_to("/recommendations", { :notice => "Recommendation deleted successfully." } )
  end
end
