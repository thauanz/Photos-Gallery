class PagesController < ApplicationController
  def index
    @galleries = Gallery.all
  end
end

