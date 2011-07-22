class GalleriesController < ApplicationController
  def show
    @gallery = Gallery.find(params[:id])
  end
end

