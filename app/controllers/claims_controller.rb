class ClaimsController < ApplicationController

before_action :authenticate_recipient!, except: [:show, :confirm, :show_confirm, :confirm_by_text]
before_action :authenticate_donor!, except: [:create, :confirm_by_text] #get rid of second thing..?
skip_before_action :verify_authenticity_token, only: [:confirm_by_text]

  def create
    if current_recipient
      donation = Donation.find params[:donation_id]
      @claim = current_recipient.claim_donation donation
    #Claim.create! donation_id: params[:donation_id], recipient_id: params[:recipient_id]
      render :create, formats: [:json]
    else
      render json: { error: "not found" }, status: 404
    end
  end

  def show
    @claim = Claim.find params[:claim_id]
    if @claim.donation.donor == current_donor
      render :show, formats: [:json]
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
      # render json: { status: :ok }
      redirect_to donor_root_path
    else
      render json: { error: "not found", donor: current_donor }, status: 404
    end
  end

  def confirm_by_text
    if Claim.where(id: params["Body"].to_i).count != 0
      claim = Claim.find params["Body"].to_i
      number = params["From"]
      number[0] = ""
      number[0] = ""
      @donor = Donor.find_by(contact_number: number)

      if claim.donation.donor == @donor

        @donor.approve_claim claim
    # does check that donor is the right person and that the number in the response corresponds to a claim
    # does text if the number doesn't correspond to a claim, but does NOT text a person who sends the number..?
    # without being the owner of that claim
        render :confirmation_text, formats: [:xml]
      else
        render :error_text, formats: [:xml]
      end
    else
      render :error_text, formats: [:xml]
    end
  end


# figure out flash messages for not authenticated, etc.
end

