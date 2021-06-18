class VideoUploadJob < ApplicationJob
  queue_as :default

  def perform(job)
    debugger
    @video = Video.new(job)
      if @video.save
         @video
      end
  end
end
