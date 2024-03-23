require 'flickr'

class StaticPagesController < ApplicationController
  def index 
    if params[:flickr_id]
      Flickr.cache = '/tmp/flickr-api.yml'
      flickr = Flickr.new
      @photos_urls = flickr.photos.search(user_id: params[:flickr_id], per_page: 20).map do |photo|
        Flickr.url_z(flickr.photos.getInfo(:photo_id => photo.id))
      end
    end
  end
end

