class Recipient < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :claims

  def claim_donation donation
    unless Claim.find_by(donation_id: donation.id) && Claim.find_by(donation_id: donation.id).approved? == true
      Claim.create! donation_id: donation.id, recipient_id: self.id
    end
  end

end
