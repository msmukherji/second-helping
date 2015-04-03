class DonorMailer < ApplicationMailer
  default from: "secondhelping@example.com"

  def confirm_claim claim
    @recipient = claim.recipient
    mail(to: @recipient.email, subject: 'Sample Email')
  end

end
