# class RecipientsController < ApplicationController
#   def update
#     @recipient = current_recipient

#     if @recipient.update_attributes(donor_profile_parameters)
#       redirect_to home_path, notice:  "Your profile has been successfully updated."
#     else
#       render action: "edit" # not sure about this
#     end
#   end

# private
#   def recipient_profile_parameters
#     params.require(:recipient).permit(:name, :password, :password_confirmation, 
#       :email, :name)
#   end
# end