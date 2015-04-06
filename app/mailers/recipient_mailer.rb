class RecipientMailer < ApplicationMailer
  default from: "secondhelping@example.com"

  def alert_claim claim
    @claim = claim
    @donor = claim.donation.donor
    @recipient = claim.recipient
    @donation = claim.donation
    mail(to: @donor.email, subject: 'Someone has claimed your donation')
  end

end
