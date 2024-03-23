require 'flickr'

class StaticPagesController < ApplicationController
  def index 
    if params[:flickr_id]
      flickr = Flickr.new
      @list   = flickr.photos.getRecent
    end
  end
end

