class DonationsController < ApplicationController
  before_action :authenticate_recipient!, except: [:new, :create]
  before_action :authenticate_donor!, except: [:index, :show] 


  def index
    @donations = Donation.all
    render json: :index
  end

  def show
    @donation = Donation.find(params[:donation_id])
    render json: :show
  end

  def new
    @donor_org = current_donor.organization
    render json: :new
  end

  def create
    #if current_donor
      @donation = current_donor.create_donation params
    # Donation.create! name: params[:name], description: params[:description], 
    #   requirements: params[:requirements], donor_id: current_donor.id, 
    #   auto_confirm: params[:auto_confirm]
      render json: :create
    #else
     # render json: { error: "not found"}, status: 404
    #end
  end

end
