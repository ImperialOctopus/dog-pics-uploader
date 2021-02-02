class SubmissionsController < ApplicationController
  include ActiveStorage::SendZip

  def index
    @submissions = Submission.all
  end

  def new
    @submission = Submission.new
    @count = Submission.count
  end

  def create
    @submission = Submission.new(submission_params)
    @count = Submission.count
    if @submission.save
      flash[:success] = 'Dog uploaded successfully! Thank you!'
      redirect_to :index
    else
      render 'new'
    end
  end

  def show
    @submission = Submission.find(params[:id])
  end

  def edit
    @submission = Submission.find(params[:id])
  end

  def update
    @submission = Submission.find(params[:id])
    if @submission.update(submission_params)
      flash[:success] = 'Update saved'
      redirect_to :submissions
    else
      render 'edit'
    end
  end

  def destroy
    @submission = Submission.find(params[:id])
    flash[:success] = 'Submission destroyed' if @submission.destroy
    redirect_to :submissions
  end

  def export
    @submissions = Submission.all
    respond_to do |format|
      format.html { render }
      format.csv do
        send_data @submissions.to_csv, filename: 'dog_pics_database.csv'
      end
      format.zip do
        send_zip(
          Hash[
            @submissions.map do |submission|
              [format('%03d', submission.id), submission.image]
            end
          ],
          filename: 'dog_pics.zip',
        )
        #send_zip(
        #  @submissions.map do |submission|
        #    sub = submission.image.blob
        #    sub.update(
        #      filename:
        #        "#{submission.id}.#{submission.image.filename.extension}",
        #    )
        #    return sub
        #  end,
        #  filename: 'dog_images.zip',
        #)
      end
    end
  end

  private

  def submission_params
    # It's mandatory to specify the nested attributes that should be permitted.
    # If you use `permit` with just the key that points to the nested attributes hash,
    # it will return an empty hash.
    params
      .require(:submission)
      .permit(
        :name,
        :breed,
        :image,
        :commit,
        :authenticity_token,
        :privacy_policy,
      )
  end
end
