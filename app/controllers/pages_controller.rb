class PagesController < ApplicationController
  def permalink
    @about = Page.find_by(permalink: params[:permalink])
  end
end
