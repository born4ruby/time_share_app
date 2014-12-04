class ReservationMailer < ActionMailer::Base
  default from: "no-reply@example.com"

  def reservation_completion_email(reservation)
    @reservation = reservation
    mail(to: "tours@example.com", subject: 'Time Share Scheduled')
  end
end
