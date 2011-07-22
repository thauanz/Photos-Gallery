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

  def new_picture
    "/admin/galleries/1/pictures/new"
  end

  def show_picture
    "/admin/galleries/1/pictures/1"
  end

  def edit_picture
    "/admin/galleries/1/pictures/1/edit"
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

  def show_gallery
    "/admin/galleries/1"
  end

  def edit_gallery
    "/admin/galleries/1/edit"
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

end

