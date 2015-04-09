class AddTextAlertToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :text_alert, :boolean
  end
end
