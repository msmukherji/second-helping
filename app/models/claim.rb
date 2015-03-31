class Claim < ActiveRecord::Base
  belongs_to :recipient
  belongs_to :donation
end
