class AddPaymentIdToUserPayments < ActiveRecord::Migration
  def change
  	add_column :user_payments, :payment_id, :string
  end
end
