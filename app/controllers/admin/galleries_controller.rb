class Admin::GalleriesController < Admin::AdminController
  def index
    @galleries = current_user.galleries.all
  end

  def new
    @gallery = Gallery.new
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def create
    @gallery = current_user.galleries.build(params[:gallery])
    flash[:notice] = "Gallery was successfully created." if @gallery.save
    respond_with @gallery, location: admin_galleries_url
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])
    flash[:notice] = "Gallery was successfully updated." if @gallery.update_attributes(params[:gallery])
    respond_with @gallery, location: admin_galleries_url
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    respond_with @gallery, location: admin_galleries_url
  end

end

