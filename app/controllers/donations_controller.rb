class DonationsController < ApplicationController
  before_action :authenticate_recipient!, except: [:new, :create, :show_donors]
  before_action :authenticate_donor!, except: [:index, :show] 

  def index
    @donations = Donation.all
    render :index, formats: [:json]
  end

  def show
    @donation = Donation.find(params[:donation_id])
    render :show, formats: [:json]
  end

  def new
    @donor_org = current_donor.organization
    render :new, formats: [:json]
  end

  def create
    @donation = current_donor.create_donation params
    render :create, formats: [:json]
  end

  def show_donors
    binding.pry
    @donor = current_donor
    render :show_donor, formats: [:json]
  end

end
