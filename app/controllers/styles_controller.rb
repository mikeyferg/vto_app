class StylesController < ApplicationController


  def show
    @style = find_style
    @style_background = Style.last.header_background_color
    @style_text = Style.last.body_text_color
    @style_star = Style.last.header_background_star_color
  end

  def new
    @style_background = Style.last.header_background_color
    @style_text = Style.last.body_text_color
    @style_star = Style.last.header_background_star_color
    @style = Style.new

  end

  def create
    @style = Style.new(video_params)
    if @style.save
      redirect_to style_path(@style)
    else
      render 'new'
    end
  end

  private
  def find_style
    Style.find(params[:id])
  end
  def video_params
    params.require(:style).permit(:header_background_color, :header_text_color, :header_background_star_color, :body_background_color, :body_text_color)
  end
end
