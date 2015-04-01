class SurveysController < ApplicationController

	def index
		@surveys = Survey.all
	end

	def show
		id = params[:id] # get survey from URL
		@survey = Survey.find(id)
	end

  def new
    #default: render 'new' template
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      flash[:notice] = "#{@survey.title} was successully created."
      redirect_to surveys_path
    else
      flash[:warning] = "Title cannot be empty"
      render 'new'
    end
  end

  def edit
    @survey = Survey.find(params[:id])
  end
  def update
    @survey = Survey.find(params[:id])
    if @survey.update_attributes!(survey_params)
      flash[:notice] = "Update Successful"
    else
      flash[:warning] = "Update Failed"
    end
    redirect_to surveys_path
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    flash[:notice] = "survey '#{@survey.title}' deleted."
    redirect_to surveys_path
  end


private
def survey_params
  params.require(:survey).permit(:title)
end

end
