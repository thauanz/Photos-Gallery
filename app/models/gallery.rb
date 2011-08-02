class Gallery
  include Mongoid::Document

  field :name, :type => String
  referenced_in :user
  embeds_many :pictures

  validates_presence_of :name
  validates_presence_of :user
end

