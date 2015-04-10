class AddStuffToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :donor, :string 
    add_column :donations, :donor_contact, :string
  end
end
