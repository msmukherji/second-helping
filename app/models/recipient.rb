class Recipient < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :claims

  def claim_donation donation
    unless Claim.find_by(donation_id: donation.id) && Claim.find_by(donation_id: donation.id).approved? == true
      claim = Claim.create! donation_id: donation.id, recipient_id: self.id
      notify_claimed claim
      if donation.donor.text_alert == true
        send_text_message claim
      end
    end
  end

  def notify_claimed claim
    mailer = RecipientMailer.alert_claim claim
    mailer.deliver_later
  end

  def send_text_message claim
    number_to_send_to = self.donation.donor.contact_number
 
    twilio_sid = Figaro.env.twilio_account_sid
    twilio_token = Figaro.env.twilio_auth_token
    twp = Figaro.env.twilio_phone_number
    message = "#{claim.recipient.name} has claimed your donation of #{claim.donation.name}.  Reply with '#{claim.id}' to approve."
    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
 
    @twilio_client.account.sms.messages.create(
      :from => "+1#{twp}",
      :to => number_to_send_to,
      :body => message
    )
  end
end
