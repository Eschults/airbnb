class Photo < ActiveRecord::Base
  belongs_to :flat

  validates_presence_of :flat, :url
end
