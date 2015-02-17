class CreateUserPayments < ActiveRecord::Migration
  def change
    create_table :user_payments do |t|
      t.integer :user_id
      t.string :payment_type
      t.string :plantype

      t.timestamps null: false
    end
  end
end
