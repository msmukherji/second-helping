class AddDefaultToDonationAutoconfirm < ActiveRecord::Migration
  def change
    change_column_default :donations, :auto_confirm, false 
  end
end
