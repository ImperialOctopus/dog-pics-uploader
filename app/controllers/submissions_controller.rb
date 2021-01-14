class SubmissionsController < ApplicationController
  def show
    @submission = Submission.find(params[:id])
  end

  def new
    @submission = Submission.new
  end

  def create
    @submission = Submission.new(submission_params)
    if (@user.save)
      # Handle a successful save.
    else
      render 'new'
    end
  end

  private

    def submission_params
      # It's mandatory to specify the nested attributes that should be permitted.
      # If you use `permit` with just the key that points to the nested attributes hash,
      # it will return an empty hash.
      params.require(:name, :email, :image).permit(:name, :email, :breed, :image)
    end
end
