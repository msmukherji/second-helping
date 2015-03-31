class Organization < ActiveRecord::Base
  has_many :donors
  has_many :donations, through: :donors
end
