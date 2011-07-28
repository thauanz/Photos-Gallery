class Gallery
  include Mongoid::Document

  field :name, :type => String
  belongs_to :user
  has_many :pictures

  validates_presence_of :name
  validates_presence_of :user
end

