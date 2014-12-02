class Flat < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  has_many :bookings
  has_many :photos
  has_many :reviews

  validates_presence_of :title, :price, :owner
  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/
end
