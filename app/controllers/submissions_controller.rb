class SubmissionsController < ApplicationController
  def show
    @submission = Submission.find(params[:id])
  end

  def new
    @submission = Submission.new
  end

  def create
    @submission = Submission.new(submission_params)
    if @submission.save
      flash[:success] = 'Welcome to the Sample App!'
      redirect_to @submission
    else
      render 'new'
    end
  end

  def edit
    @submission = Submission.find(params[:id])
  end

  private

  def submission_params
    # It's mandatory to specify the nested attributes that should be permitted.
    # If you use `permit` with just the key that points to the nested attributes hash,
    # it will return an empty hash.
    params
      .require(:submission)
      .permit(:name, :email, :breed, :image, :authenticity_token, :commit)
  end
end
