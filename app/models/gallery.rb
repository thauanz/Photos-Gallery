class Gallery < ActiveRecord::Base
  belongs_to :user
  has_many :pictures

  validates_presence_of :name
  validates_presence_of :user_id
end

