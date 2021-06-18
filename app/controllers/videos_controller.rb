class VideosController < ApplicationController
  before_action :set_video, only: %i[ show edit update destroy ]

  def index
    @videos = Video.all
  end

  def show
  end

  def new
    @video = Video.new
  end

  def edit
  end

  def create
    debugger
     if VideoUploadJob.perform_now(job) 
      respond_to do |format|
      format.html { redirect_to videos_url, notice: "Video was successfully destroyed." }
      format.json { head :no_content }
     end
    end
  end

  # def abc
  #   redirect_to @video 
  # end

  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: "Video was successfully updated." }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: "Video was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_video
      @video = Video.find(params[:id])
    end

    def video_params
      params.require(:video).permit(:title, :description, :thumbnail)
    end

    def job
      params.require(:video).permit(:title, :description, :thumbnail)
    end
end
