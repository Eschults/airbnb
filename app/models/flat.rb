class Flat < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'

  has_many :bookings
  has_many :photos
  has_many :reviews

  validates_presence_of :title, :price, :owner
end
