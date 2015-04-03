cclass ClaimsController < ApplicationController
before_action :authenticate_recipient!, except: [:show, :confirm]
before_action :authenticate_donor!, except: [:create]

  def create
    if current_recipient
      donation = Donation.find params[:donation_id]
      @claim = current_recipient.claim_donation donation
    #Claim.create! donation_id: params[:donation_id], recipient_id: params[:recipient_id]
      render json: :create
    else
      render json: { error: "not found" }, status: 404
    end
    # send notification to donor
  end

  def show
    @claim = Claim.find params[:claim_id]
    if @claim.donation.donor == current_donor
      render json: :show
    else
      render json: { error: "not found" }, status: 404
    end
  end

  def confirm
    claim = Claim.find params[:claim_id]
    if claim.donation.donor == current_donor
      current_donor.approve_claim claim
      #claim.update! approved: true
      render json: { status: :ok }
    else
      render json: { error: "not found" }, status: 404
    end
    # send notification to recipient
  end

# figure out flash messages for not authenticated, etc.
end

