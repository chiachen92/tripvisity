class VotesController < ApplicationController
  # before_action :authenticate_user

  def create
    comment = Comment.find params[:comment_id]
    vote = Vote.new vote_params
    vote.user = current_user
    vote.comment = comment
    if vote.save
      redirect_to trip_path(comment.trip_id), notice: "Vote!"
    else
      redirect_to trip_path(comment.trip_id), alert: vote.errors.full_messages
    end
  end

  def destroy
    comment = vote.comment
    vote.destroy
    redirect_to trip_path(comment.trip_id)
  end

  def update
    comment = vote.comment
    if vote.update vote_params
      redirect_to trip_path(comment.trip_id)
    else
      redirect_to trip_path(comment.trip_id), alert: vote.error_description
    end
  end

  def search_support_path
    redirect_to trips_path
  end

  private
  def vote_params
    params.require(:vote).permit(:is_up, :comment_id)
  end


  def vote
    @vote ||= Vote.find params[:id]
  end


end
