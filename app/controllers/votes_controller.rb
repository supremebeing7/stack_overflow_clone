class VotesController < ApplicationController

  def index
    @votes = Vote.all
  end

  def show
    @vote = Vote.find(params[:id])
  end

  def new
    @vote = Vote.new
  end

  def edit
    @vote = Vote.find(params[:id])
  end

  def update
    @vote = Vote.find(params[:id])
    if @vote.update(votes_params)
      redirect_to vote_path
    else
      render 'edit'
    end
  end

  def create
    @vote = Vote.create(votes_params)
    if @vote.save
      redirect_to(root_path)
    else
      render 'new'
    end
  end

  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy
    redirect_to(root_path)
  end

private

  def votes_params
    params.require(:vote).permit(:votable_id, :votable_type, :user_id, :status)
  end
end
