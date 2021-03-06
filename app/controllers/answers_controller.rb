class AnswersController < ApplicationController

  def index
    @answers = Answer.all
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
      if params[:answer][:best]
        @answer.question.answers.each do |answer|
          answer.update(best: false)
        end
      end
    if @answer.update(answers_params)
      redirect_to question_path(@answer.question)
    else
      render 'edit'
    end
  end

  def create
    @answer = Answer.create(answers_params)
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
