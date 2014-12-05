class Flat < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'

  has_many :bookings
  has_many :photos
  has_many :reviews
  has_one :address

  accepts_nested_attributes_for :photos, :allow_destroy => true
  accepts_nested_attributes_for :address, :allow_destroy => true
  validates_presence_of :title, :price, :owner, :address

  def available?(first_day, last_day)
    output = true
    if self.bookings
      self.bookings.each do |booking|
        if (booking.start_date..booking.end_date).include? first_day || (booking.start_date..booking.end_date).include? last_day
          output = false
          break
        end
      end
    end
    output
  end

end