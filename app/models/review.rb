class Review < ActiveRecord::Base
  belongs_to :flat
  belongs_to :user

  validates_presence_of :flat, :user, :rating
end
