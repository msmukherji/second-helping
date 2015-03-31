class CreateClaims < ActiveRecord::Migration
  def change
    create_table :claims do |t|
      t.integer  :donation_id
      t.integer  :recipient_id
      #t.integer  :sms_code
      t.boolean  :approved, default: false
      t.timestamps null: false
    end
  end
end
