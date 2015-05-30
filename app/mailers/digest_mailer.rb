class DigestMailer < ApplicationMailer
  default from: "secondhelping@example.com"

  def digest_email recipient
    @recipient = recipient
    @donations = Donation.where "expiration > ?", Time.now
    mail(to: @recipient.email, subject: 'Second Helpings available today')
  end

end