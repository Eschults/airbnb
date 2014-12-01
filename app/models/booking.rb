class Booking < ActiveRecord::Base
  belongs_to :flat
  belongs_to :user

  validates_presence_of :user, :flat, :start_date, :end_date
end
