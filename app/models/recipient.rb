class Recipient < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :claims
end


# class Recipient::ParameterSanitizer < Devise::ParameterSanitizer
#   def sign_in
#     default_params.permit(:username, :email) # other stuff here
#   end
# end