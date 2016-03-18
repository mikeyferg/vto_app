class VideosController < ApplicationController
  include Transloadit::Rails::ParamsDecoder
  def index
    @videos = Video.all
    @style_text = Style.last.body_text_color
    @style_background = Style.last.header_background_color
    @style_star = Style.last.header_background_star_color
  end

  def show
    @video = find_video
    @style_background = Style.last.header_background_color
    @style_text = Style.last.body_text_color
    @style_star = Style.last.header_background_star_color
  end

  def new
    @video = Video.new
    @style_background = Style.last.header_background_color
    @style_text = Style.last.body_text_color
    @style_star = Style.last.header_background_star_color
  end

  def create
    @video = Video.new(url: params[:transloadit][:results][:flash_encoding][0]['url'], thumbnail: params[:transloadit][:results][:extracted_thumbs][0]['url'], thumbnail_face: params[:transloadit][:results][:thumb][0]['url'])
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
    params.require(:video).permit(:url, :thumbnail, :thumbnail_face)
  end
end
