class QuestionsController < ApplicationController

  before_filter :find_survey!
	def index
		@questions = @survey.questions
	end

  def new
  end

  def create
    @question = Question.new(question_params.merge(:survey => @survey))
    if @question.save!
      flash[:notice] = "Question was successully created."
      redirect_to survey_questions_path
    else
      # Put warning message here
      render 'new'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @updated_question = question_params.merge(:survey => @survey)
    if @question.update_attributes!(@updated_question)
      flash[:notice] = "Update Successful."
    else
      flash[:notice] = "Update Failed"
    end 
    redirect_to survey_questions_path
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "Question deleted in '#{@survey.title}'."
    redirect_to survey_questions_path
  end

  private
  def find_survey!
    @survey =  Survey.find(params[:survey_id])
  end
  def question_params
    params.require(:question).permit(:question_text,:question_type,:answer_options)
  end
end
