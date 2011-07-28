require "spec_helper"

describe Admin::PicturesController do
  describe "routing" do

    before(:each) do
      @gallery = Factory.create(:gallery)
      @picture = Factory.create(:picture, gallery: @gallery)
    end

    it "routes to #new" do
      get(new_picture(1)).should route_to("admin/pictures#new", gallery_id: "1")
    end

    it "routes to #show" do
      get(show_picture(1, 1)).should route_to("admin/pictures#show", id: "1", gallery_id: "1")
    end

    it "routes to #edit" do
      get(edit_picture(1, 1)).should route_to("admin/pictures#edit", id: "1", gallery_id: "1")
    end

    it "routes to #create" do
      post(create_picture).should route_to("admin/pictures#create", gallery_id: "1")
    end

    it "routes to #update" do
      put(update_picture).should route_to("admin/pictures#update", id: "1", gallery_id: "1")
    end

    it "routes to #destroy" do
      delete(destroy_picture).should route_to("admin/pictures#destroy", id: "1", gallery_id: "1")
    end

  end
end

