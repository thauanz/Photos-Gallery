class Admin::AdminController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json
  layout "admin"
end

