class VideosController < ApplicationController
  include Transloadit::Rails::ParamsDecoder
  def index
    @videos = Video.all
  end

  def show
    @video = find_video
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(url: params[:transloadit][:results][:flash_encoding][0]['url'], thumbnail: params[:transloadit][:results][:extracted_thumbs][0]['url'])
    if @video.save
      redirect_to video_path(@video)
    else
      render 'new'
    end
    Rails.logger.info("PARAMS: #{params[:transloadit][:results].inspect}")
  end

  private
  def find_video
    Video.find(params[:id])
  end
  def video_params
    params.require(:video).permit(:url, :thumbnail)
  end
end
