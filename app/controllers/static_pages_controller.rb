class StaticPagesController < ApplicationController
  def main_page
    @style_background = Style.last.header_background_color
    @style_text = Style.last.body_text_color
    @style_star = Style.last.header_background_star_color
  end
end
