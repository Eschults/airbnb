class Address < ActiveRecord::Base
  belongs_to :flat

  def address_complete
    "#{self.number} #{self.street}, #{self.zip_code} #{self.city}"
  end

  geocoded_by :address_complete
  after_validation :geocode
end
