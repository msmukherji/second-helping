class AddExpirationDateToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :expiration, :datetime
  end
end
