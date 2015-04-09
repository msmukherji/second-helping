class AddPhoneNumberToRecipients < ActiveRecord::Migration
  def change
    add_column :recipients, :contact_number, :string
  end
end
