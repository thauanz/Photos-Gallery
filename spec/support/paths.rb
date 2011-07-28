module NavigationsHelpers

  def homepage
    "/"
  end

  def sign_in
    "/sign_in"
  end

  def sign_up
    "/sign_up"
  end

  def new_password
    "password/new"
  end

  def sign_out
    "/sign_out"
  end

  #Pictures

  def new_picture(id)
    "/admin/galleries/#{id}/pictures/new"
  end

  def show_picture(gallery_id, picture_id)
    "/admin/galleries/#{gallery_id}/pictures/#{picture_id}"
  end

  def edit_picture(gallery_id, picture_id)
    "/admin/galleries/#{gallery_id}/pictures/#{picture_id}/edit"
  end

  def create_picture
    "/admin/galleries/1/pictures"
  end

  def update_picture
    "/admin/galleries/1/pictures/1"
  end

  def destroy_picture
    "/admin/galleries/1/pictures/1"
  end

  #Galleries
  def galleries
    "/admin/galleries"
  end

  def new_gallery
    "/admin/galleries/new"
  end

  def show_gallery(id)
    "/admin/galleries/#{id}"
  end

  def edit_gallery(id)
    "/admin/galleries/#{id}/edit"
  end

  def create_gallery
    "/admin/galleries"
  end

  def update_gallery
    "/admin/galleries/1"
  end

  def destroy_gallery
    "/admin/galleries/1"
  end

  def show_picture_none(gallery_id, picture_id)
    "/galleries/#{gallery_id}/pictures/#{picture_id}"
  end

end

