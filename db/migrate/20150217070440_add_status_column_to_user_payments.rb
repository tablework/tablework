class AddStatusColumnToUserPayments < ActiveRecord::Migration
  def change
  	add_column :user_payments, :status, :string
  end
end
