class AnswersController < ApplicationController

  def index
    @answers = Answer.all
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def new
    @answer = Answer.new
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update(answers_params)
      redirect_to answer_path
    else
      render 'edit'
    end
  end

  def create
    @answer = Answer.new(answers_params)
    if @answer.save
      respond_to do |format|
        format.html { redirect_to question_path(@answer.question) }
        format.js
      end
    else
      redirect_to :back, notice: "Errors in your answer"
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to(root_path)
  end

private

  def answers_params
    params.require(:answer).permit(:user_id, :question_id, :content, :best)
  end
end
