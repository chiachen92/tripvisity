class CommentsController < ApplicationController

  def create
    @trip = Trip.find params[:trip_id]
    @comment = Comment.new comment_params
    @comment.user = current_user
    @comment.trip = @trip
    if @comment.save
      redirect_to trip_path(@trip)
    else
      render 'trips/show'
    end
  end

  # def show
  #   @trip = Trip.find params[:trip_id]
  #   @comment = Comment.new
  # end

  # def index
  #   @comment = Comment.order(created_at: :desc)
  # end
  #
  # def edit
  #   @comment = Comment.find params[:id]
  # end
  #
  # def update
  #   @comment = Comment.find params[:id]
  #   if @comment.update = Comment comment_params
  #     flash[:success] = "Comment was successfully updated"
  #     redirect_to trip_comment_path(@comment)
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    @trip = Trip.find params[:trip_id]
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to trip_path(@comment)
    flash[:danger] = "Comment was deleted"
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :trip_id, :user_id)
  end

end
