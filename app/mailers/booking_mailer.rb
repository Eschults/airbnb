class BookingMailer < ActionMailer::Base
  default from: "florianboret@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.book.subject
  #
  def book(booking)
    @booking = booking

    mail(to: @booking.flat.owner.email, subject: "CONGRATS! you have a new booking ! ")
  end

  def accept(booking)
    @booking = booking

    mail(to: @booking.user.email, subject: "CONGRATS! Your booking has been accepted! ")
  end

  def decline(booking)
    @booking = booking

    mail(to: @booking.user.email, subject: "Sorry! Your booking has been declined!")
  end
end
