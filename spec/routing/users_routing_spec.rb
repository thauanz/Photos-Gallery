require "spec_helper"

describe "routes for access" do

  it "routes invalid sign up" do
    { :get => sign_up }.should_not be_routable
  end

  it "routes /sign_in to system" do
    get(sign_in).should route_to(:controller => "admin/sessions", :action => "new")
  end

  it "routes /password/new to the lost password" do
    get(new_password).should route_to(:controller => "admin/passwords", :action => "new")
  end

  it "routes /sign_out to system" do
    get(sign_out).should route_to(:controller => "admin/sessions", :action => "destroy")
  end

end

