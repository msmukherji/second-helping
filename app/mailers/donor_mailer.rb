class DonorMailer < ApplicationMailer
  default from: "secondhelping@example.com"

  def confirm_claim claim
    @claim = claim
    @recipient = claim.recipient
    @donation = claim.donation
    mail(to: @recipient.email, subject: 'Claim approved!')
  end

end
