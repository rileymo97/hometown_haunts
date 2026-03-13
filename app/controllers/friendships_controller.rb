class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @all_users = User.where.not(id: current_user.id)
    @incoming = Friendship.where(recipient_id: current_user.id, request_status: "pending")
    @outgoing = Friendship.where(requester_id: current_user.id, request_status: "pending")
    @friends = Friendship.where(request_status: "accepted")
                         .where("requester_id = ? OR recipient_id = ?", current_user.id, current_user.id)
    render({ :template => "friendship_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_friendships = Friendship.where({ :id => the_id })

    @the_friendship = matching_friendships.at(0)

    render({ :template => "friendship_templates/show" })
  end

  def create
    friendship = Friendship.new
    friendship.requester_id = current_user.id
    friendship.recipient_id = params.fetch("recipient_id")
    friendship.request_status = "pending"
    friendship.save
    redirect_to("/friends", { :notice => "Friend request sent!" })
  end

  def accept
    friendship = Friendship.find(params[:id])
    friendship.request_status = "accepted"
    friendship.save
    redirect_to("/friends", { :notice => "Friend request accepted!" })
  end

  def decline
    friendship = Friendship.find(params[:id])
    friendship.request_status = "declined"
    friendship.save
    redirect_to("/friends", { :notice => "Friend request declined." })
  end

  def update
    the_id = params.fetch("path_id")
    the_friendship = Friendship.where({ :id => the_id }).at(0)

    the_friendship.requester_id = params.fetch("query_requester_id")
    the_friendship.recipient_id = params.fetch("query_recipient_id")
    the_friendship.request_status = params.fetch("query_request_status")

    if the_friendship.valid?
      the_friendship.save
      redirect_to("/friendships/#{the_friendship.id}", { :notice => "Friendship updated successfully." } )
    else
      redirect_to("/friendships/#{the_friendship.id}", { :alert => the_friendship.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_friendship = Friendship.where({ :id => the_id }).at(0)

    the_friendship.destroy

    redirect_to("/friendships", { :notice => "Friendship deleted successfully." } )
  end
end
