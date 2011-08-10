class PicturesController < ApplicationController

  def show
    @gallery = Gallery.find(params[:gallery_id])
    @picture = @gallery.pictures.find(params[:id])
    @pictures = @gallery.pictures.excludes(id: @picture.id)
  end
end

