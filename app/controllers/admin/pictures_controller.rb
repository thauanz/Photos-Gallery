class Admin::PicturesController < Admin::AdminController

  before_filter :find_gallery
  before_filter :find_picture

  def show
    @pictures = @gallery.pictures.excludes(id: @picture.id)
  end

  def new
  end

  def edit
  end

  def create
    @picture = @gallery.pictures.create(params[:picture])
    flash[:notice] = 'Picture was successfully created.' if @picture.save
    respond_with @picture, location: admin_gallery_url(@gallery)
  end

  def update
    flash[:notice] = 'Picture was successfully updated.' if @picture.update_attributes(params[:picture])
    respond_with @picture, location: admin_gallery_url(@gallery)
  end

  def destroy
    flash[:notice] = 'Picture was deleted.' if @picture.destroy
    respond_with @picture, location: admin_gallery_url(@gallery)
  end

protected
  def find_gallery
    @gallery = current_user.galleries.find(params[:gallery_id])
  end

  def find_picture
    @picture = params[:id] ? @gallery.pictures.find(params[:id]) : @gallery.pictures.build
  end

end

