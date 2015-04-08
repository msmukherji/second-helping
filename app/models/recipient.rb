class Recipient < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :claims

  def claim_donation donation
    # this does not seem to be working -- 
    # no error is raised when you try to claim a 
    # donation that already has an approved claim
    unless Claim.find_by(donation_id: donation.id) && Claim.find_by(donation_id: donation.id).approved? == true
      claim = Claim.create! donation_id: donation.id, recipient_id: self.id
      notify_claimed claim
    end
  end

  def notify_claimed claim
    mailer = RecipientMailer.alert_claim claim
    mailer.deliver_later
  end
end
