class ClaimsController < ApplicationController
before_action :authenticate_recipient!, except: [:show, :confirm]
before_action :authenticate_donor!, except: [:create]

  def create
    :authenticate_recipient!
    @claim = Claim.create! donation_id: params[:donation_id], recipient_id: params[:recipient_id]
    render :create
    # send notification to donor
  end

  def show
    :authenticate_donor!
    @claim = Claim.find(params[:recipient_id])
    render :show
  end

  def confirm
    :authenticate_donor!
    claim = Claim.find(params[:claim_id])
    claim.update! approved: true
    # send notification to recipient
  end

end