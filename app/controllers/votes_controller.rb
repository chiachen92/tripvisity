# class VotesController < ApplicationController
#   # before_action :authenticate_user
#
#   def create
#     vote = Vote.new vote_params
#     vote.user = current_user
#     vote.comment = comment
#     if vote.save
#       redirect_to trip_path(comment), notice: "Vote!"
#     else
#       redirect_to trip_path(question), alert: vote.error_description
#     end
#   end
#
#   def destroy
#     comment = vote.comment
#     vote.destroy
#     redirect_to trip_path(vote)
#   end
#
#   def update
#     comment = vote.comment
#     if vote.update vote_params
#       redirect_to trip_path(vote)
#     else
#       redirect_to trip_path(vote), alert: vote.error_description
#     end
#   end
#
#   private
#   def vote_params
#     params.require(:vote).permit(:is_up)
#   end
#
#   def question
#     # ||= equivalent to
#     # @question = @question || Question.friendly.find params[:question_id]
#     @question ||= Question.friendly.find params[:question_id]
#   end
#
#   def vote
#     @vote ||= Vote.find params[:id]
#   end
# end
