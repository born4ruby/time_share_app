class InvitationMailer < ActionMailer::Base
  default from: "no-reply@example.com"

  def reservation_activation_email(invitation)
    @invitation = invitation
    mail(to: @invitation.user_email, subject: 'Reservation activation link')
  end
end
