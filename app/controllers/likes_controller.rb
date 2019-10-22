class LikesController < ApplicationController
  before_action :logged_in_user

  def new
  end

  def create
    @like = Like.create(like_params)
    redirect_to ideas_path
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to ideas_path
  end

  private

  def like_params
    params.require(:like).permit(:idea_id, :user_id)
  end
end
