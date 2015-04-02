# class DonorsController < ApplicationController
#   def update
#     @donor = current_donor

#     if @donor.update_attributes(donor_profile_parameters)
#       redirect_to home_path, notice:  "Your profile has been successfully updated."
#     else
#       render action: "edit"
#     end
#   end

# private
#   def donor_profile_parameters
#     params.require(:donor).permit(:name, :password, :password_confirmation, 
#       :email, :organization, :role, :contact_number)
#   end
# end