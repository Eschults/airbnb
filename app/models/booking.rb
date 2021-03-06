class Booking < ActiveRecord::Base
  after_create :send_book_email
  after_update :send_answer_email

  belongs_to :flat
  belongs_to :user

  validates_presence_of :user, :flat, :start_date, :end_date

  private

  def send_book_email
    BookingMailer.book(self).deliver
  end

  def send_answer_email
    if self.accepted
      BookingMailer.accept(self).deliver
    else
      BookingMailer.decline(self).deliver
    end
  end
end
