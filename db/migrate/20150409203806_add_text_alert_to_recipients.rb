class AddTextAlertToRecipients < ActiveRecord::Migration
  def change
    add_column :recipients, :text_alert, :boolean
  end
end
