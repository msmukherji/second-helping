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
    raise "Can't approve other's donation" unless claim.donation.donor_id == id
    # ^^ redundant?  do i need to check this in both
    # model and controller?
    claim.update! approved: true
    notify_confirmed claim
  end

  def notify_confirmed claim
    mailer = DonorMailer.confirm_claim claim
    mailer.deliver_later
  end


end


