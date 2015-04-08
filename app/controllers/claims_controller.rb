class ClaimsController < ApplicationController
before_action :authenticate_recipient!, except: [:show, :confirm, :show_confirm]
before_action :authenticate_donor!, except: [:create]

  def create
    if current_recipient
      donation = Donation.find params[:donation_id]
      @claim = current_recipient.claim_donation donation
    #Claim.create! donation_id: params[:donation_id], recipient_id: params[:recipient_id]
      render :create, format: :json
    else
      render json: { error: "not found" }, status: 404
    end
  end

  def show
    @claim = Claim.find params[:claim_id]
    if @claim.donation.donor == current_donor
      render :show, format: :json
    else
      render json: { error: "not found" }, status: 404
    end
  end

  def show_confirm
    @claim = Claim.find params[:claim_id]
    render :show_confirm
  end

  def confirm
    claim = Claim.find params[:claim_id]
    if claim.donation.donor == current_donor
      current_donor.approve_claim claim
      #claim.update! approved: true
      render json: { status: :ok }
      # should this redirect?
    else
      render json: { error: "not found", donor: current_donor }, status: 404
    end
  end


# figure out flash messages for not authenticated, etc.
end

