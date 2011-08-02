class PicturesController < ApplicationController

  def show
    @gallery = Gallery.find(params[:gallery_id])
    @picture = @gallery.pictures.where(id: params[:id])
  end
end

