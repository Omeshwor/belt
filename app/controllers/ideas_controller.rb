class IdeasController < ApplicationController
  before_action :logged_in_user, except: [:index]
  def index
    @ideas = Idea.left_joins(:likes).group(:id).order('Count(likes.id) DESC')
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      flash[:notice] = "Idea Added"
      redirect_to ideas_path
    else
      flash[:errors] = @idea.errors.full_messages
      redirect_to ideas_path
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    redirect_to user_path(current_user)
  end

  def show
    @idea = Idea.find(params[:id])
  end

  private
  def idea_params
    params.require(:idea).permit(:content).merge(user: User.find(current_user.id))
  end
end
