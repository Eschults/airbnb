class Flat < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'

  has_many :bookings
  has_many :photos
  has_many :reviews
  has_one :address

  accepts_nested_attributes_for :photos, :allow_destroy => true
  accepts_nested_attributes_for :address, :allow_destroy => true
  validates_presence_of :title, :price, :owner
end