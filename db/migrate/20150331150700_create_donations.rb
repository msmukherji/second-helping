class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string   :name
      t.integer  :donor_id
      t.text     :description
      t.text     :requirements
      t.boolean  :auto_confirm
      #t.integer  :claim_id
      t.timestamps null: false
    end
  end
end
