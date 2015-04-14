class Donor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many   :donations
  belongs_to :organization

  attr_accessible :text_alert

  def create_donation params
    Donation.create! name: params[:name], description: params[:description], 
      requirements: params[:requirements], donor_id: self.id, 
      auto_confirm: params[:auto_confirm]
  end

  def approve_claim claim
    raise "Can't approve other's donation" unless claim.donation.donor_id == self.id
    claim.update! approved: true
    notify_confirmed claim
    if claim.recipient.text_alert == true
      text_approval_notification claim
    end
  end

  def notify_confirmed claim
    mailer = DonorMailer.confirm_claim claim
    mailer.deliver_later
  end

  def text_approval_notification claim
    number_to_send_to = claim.recipient.contact_number
 
    twilio_sid = Figaro.env.twilio_account_sid
    twilio_token = Figaro.env.twilio_auth_token
    twp = Figaro.env.twilio_phone_number
    message = "Your claim on #{claim.donation.name} has been approved! 
      As a reminder, here are the requirements: #{claim.donation.requirements}."
    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
 
    @twilio_client.account.sms.messages.create(
      :from => "+1#{twp}",
      :to => number_to_send_to,
      :body => message
    )
  end

end


