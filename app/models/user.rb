class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :flats, foreign_key: :owner_id
  has_many :bookings
  has_many :reviews

  validates_presence_of :last_name, :first_name, :email, :password,
end
