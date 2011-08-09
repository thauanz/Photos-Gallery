class Picture
  include Mongoid::Document

  attr_accessor :old_picture_path

  field :title, :type => String
  field :description, :type => String

  key :title

  mount_uploader :image, ImageUploader

  embedded_in :gallery, :inverse_of => :pictures

  validates :gallery, :title, :image, :presence => true

  validates_uniqueness_of :title, :case_sensitive => false

  after_validation :old_path_before_save_picture
  after_save :recreate_path_image!

private

  def recreate_path_image!
    if self.previous_changes["title"]
      picture_path = (self.previous_changes["image_filename"].present? ? self.old_picture_path : self.image.path)
      self.image.recreate_versions!
      delete_picture(picture_path)
    end
  end

  def delete_picture(picture_path)
    Dir.foreach(File.dirname(picture_path)) do |file|
      File.delete(File.join(File.dirname(picture_path), "/", file.to_s)) if File.file?(File.join(File.dirname(picture_path), "/", file.to_s))
    end
    Dir.delete(File.dirname(picture_path))
  end

  def old_path_before_save_picture
    self.old_picture_path = self.image.path
  end

end

