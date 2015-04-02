class Donor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many   :donations
  belongs_to :organization
end


class Donor::ParameterSanitizer < Devise::ParameterSanitizer
  def sign_in
    default_params.permit(:username, :email) # add the other stuff here
  end
end
# is this the thing i'm supposed to use?