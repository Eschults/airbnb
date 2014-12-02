class Flat < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'

  has_many :bookings
  has_many :photos
  has_many :reviews
  accepts_nested_attributes_for :photos, :reject_if => :all_blank, :allow_destroy => true

  validates_presence_of :title, :price, :owner
end
