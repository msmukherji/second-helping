class Donation < ActiveRecord::Base
  belongs_to :donor
  has_many   :claims
end
