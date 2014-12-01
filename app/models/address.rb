class Address < ActiveRecord::Base
  belongs_to :flat

  validates_presence_of :flat
end
