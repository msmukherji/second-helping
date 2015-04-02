class ClaimsController < ApplicationController
before_action :authenticate_recipient!, except: [:show, :confirm]
before_action :authenticate_donor!, except: [:create]

  def create
    @claim = Claim.create! donation_id: params[:donation_id], recipient_id: params[:recipient_id]
    render json: :create
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
      claim.update! approved: true
      render json: { status: :ok }
    else
      render json: { error: "not found" }, status: 404
    end
    # send notification to recipient
  end


end

