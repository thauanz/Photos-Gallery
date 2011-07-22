class Picture < ActiveRecord::Base
  attr_accessible :title, :gallery_id, :user_id, :description, :image, :remote_image_url

  belongs_to :user
  belongs_to :gallery

  validates :user_id, :gallery_id, :title, :image, :presence => true

  validates_uniqueness_of :title, :scope => :gallery_id, :case_sensitive => false

  mount_uploader :image, ImageUploader
end

