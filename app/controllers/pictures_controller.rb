class PicturesController < ApplicationController

  def show
    @picture = Picture.where(gallery_id: params[:gallery_id], id: params[:id])
  end
end

