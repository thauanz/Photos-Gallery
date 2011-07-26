class ApplicationController < ActionController::Base
  protect_from_forgery

private

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      admin_galleries_path
    else
      super
    end
  end

end

