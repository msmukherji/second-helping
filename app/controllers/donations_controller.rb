class DonationsController < ApplicationController
  before_action :authenticate_recipient!, except: [:new, :create]
  before_action :authenticate_donor!, except: [:index, :show] 


  def index
    @donations = Donation.all
    render :index
  end

  def show
    @donation = Donation.find(params[:donation_id])
    render :show
  end

  def new
    @donor_org = current_donor.organization
    #@donor_org = Donor.first.organization
    render :new
  end

  def create
    @donation = Donation.create! name: params[:name], description: params[:description], 
      requirements: params[:requirements], donor_id: current_donor.id,
      contact_number: params[:contact_number], auto_confirm: params[:auto_confirm]

    render :create
  end

end
