class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(questions_params)
      redirect_to question_path
    else
      render 'edit'
    end
  end

  def create
    @question = Question.new(questions_params)
    if @question.save
      flash[:notice] = "Question added!"
      redirect_to(root_path)
    else
      render 'new'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to(root_path)
  end

private

  def questions_params
    params.require(:question).permit(:title, :content, :user_id)
  end
end
