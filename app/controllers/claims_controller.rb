class ClaimsController < ApplicationController
before_action :authenticate_recipient!, except: [:show, :confirm]
before_action :authenticate_donor!, except: [:create]

  def create
    @claim = Claim.create! donation_id: params[:donation_id], recipient_id: params[:recipient_id]
    render :create
    # send notification to donor
  end

  def show
    @claim = Claim.find params[:recipient_id]
    render :show
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


# class ApplicationController < ActionController::Base
#   protected

#   def devise_parameter_sanitizer
#     if resource_class == Donor
#       Donor::ParameterSanitizer.new(Donor, :donor, params)
#     elsif resource_class == recipient
#       Recipient::ParameterSanitizer.new(Recipient, :recipient, params)
#     else
#       super # Use the default one
#     end
#   end
# end