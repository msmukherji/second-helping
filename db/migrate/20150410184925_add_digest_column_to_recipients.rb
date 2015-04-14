class AddDigestColumnToRecipients < ActiveRecord::Migration
  def change
    add_column :recipients, :digest, :boolean
  end
end
