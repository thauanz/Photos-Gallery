require "spec_helper"

describe Admin::PicturesController do
  describe "routing" do

    before(:all) do
      @gallery = Factory.create(:gallery)
      @picture = Factory.create(:picture, gallery: @gallery)
    end

    it "routes to #new" do
      get(new_picture(@gallery.id)).should route_to("admin/pictures#new", gallery_id: @gallery.id)
    end

    it "routes to #show" do
      get(show_picture(@gallery.id, @picture.id)).should route_to("admin/pictures#show", id: @picture.id, gallery_id: @gallery.id)
    end

    it "routes to #edit" do
      get(edit_picture(@gallery.id, @picture.id)).should route_to("admin/pictures#edit", id: @picture.id, gallery_id: @gallery.id)
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

