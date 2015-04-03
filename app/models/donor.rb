class Donor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many   :donations
  belongs_to :organization

  def create_donation params
    Donation.create! name: params[:name], description: params[:description], 
      requirements: params[:requirements], donor_id: self.id, 
      auto_confirm: params[:auto_confirm]
  end

  def approve_claim claim
    if claim.donation.donor.id == self.id
      # ^^ redundant?  do i need to check this in both
      # model and controller?
      claim.update! approved: true
      send_mailer claim
    else
      return false
    end
  end

  def send_mailer claim

  end


end


