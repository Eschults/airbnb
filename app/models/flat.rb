class Flat < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'

  has_many :bookings
  has_many :photos
  has_many :reviews
  has_one :address

  accepts_nested_attributes_for :photos, :allow_destroy => true
  accepts_nested_attributes_for :address, :allow_destroy => true
  validates_presence_of :title, :price, :owner

  def available?
    output = true
    if self.bookings
      self.bookings.each do |booking|
        if (@start_date >= booking.start_date && @start_date <= booking.end_date) || (@end_date >= booking.start_date && @end_date <= booking.end_date)
          output = false
          break
        end
      end
    end
    output
  end

end