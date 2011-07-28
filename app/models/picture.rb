class Picture
  include Mongoid::Document

  field :title, :type => String
  field :description, :type => String
  field :image, :type => String

  belongs_to :gallery

  attr_accessible :title, :gallery, :description, :image, :remote_image_url

  validates :gallery, :title, :image, :presence => true

  validates_uniqueness_of :title, :case_sensitive => false

  mount_uploader :image, ImageUploader
end

