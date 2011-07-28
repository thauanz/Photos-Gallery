class Admin::PicturesController < Admin::AdminController

  def show
    @picture = Picture.find(params[:id])
    @pictures = Picture.where(gallery_id: params[:gallery_id]).excludes(id: @picture.id)
  end

  def new
    @picture = Picture.new
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def create
    @picture = current_user.galleries.find(params[:gallery_id]).pictures.build(params[:picture])
    flash[:notice] = 'Picture was successfully created.' if @picture.save
    respond_with @picture, location: admin_gallery_url(@picture.gallery_id)
  end

  def update
    @picture = Picture.find(params[:id])
    flash[:notice] = 'Picture was successfully updated.' if @picture.update_attributes(params[:picture])
    respond_with @picture, location: admin_gallery_url(@picture.gallery_id)
  end

  def destroy
    @picture = Picture.find(params[:id])
    flash[:notice] = 'Picture was deleted.' if @picture.destroy
    respond_with @picture, location: admin_gallery_url(@picture.gallery_id)
  end

end

