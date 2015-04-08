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
      send_text_message
    end
  end

  def notify_claimed claim
    mailer = RecipientMailer.alert_claim claim
    mailer.deliver_later
  end

  def send_text_message
    number_to_send_to = "2406205793"#self.donation.donor.contact_number
 
    twilio_sid = Figaro.env.twilio_account_sid
    twilio_token = Figaro.env.twilio_auth_token
    twilio_phone_number = "2402057648"
    message = "hey the thing worked"
 
    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
 
    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => number_to_send_to,
      :body => message
    )
  end
end
