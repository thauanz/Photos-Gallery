class Admin::PicturesController < Admin::AdminController

  before_filter :gallery_resource

  def show
    @picture = @gallery.pictures.find(params[:id])
    @pictures = @gallery.pictures.excludes(id: @picture.id)
  end

  def new
    @picture = Picture.new
  end

  def edit
    @picture = @gallery.pictures.find(params[:id])
  end

  def create
    @picture = @gallery.pictures.create(params[:picture])
    flash[:notice] = 'Picture was successfully created.' if @picture
    respond_with @picture, location: admin_gallery_url(@gallery)
  end

  def update
    @picture = @gallery.pictures.find(params[:id])
    flash[:notice] = 'Picture was successfully updated.' if @picture.update_attributes!(params[:picture])
    respond_with @picture, location: admin_gallery_url(@gallery)
  end

  def destroy
    @picture = @gallery.pictures.find(params[:id])
    flash[:notice] = 'Picture was deleted.' if @picture.destroy
    respond_with @picture, location: admin_gallery_url(@gallery)
  end

protected
  def gallery_resource
    @gallery = current_user.galleries.find(params[:gallery_id])
  end

end

