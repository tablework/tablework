class AddUserReferenceToUserPayments < ActiveRecord::Migration
  def change
  	add_foreign_key :user_payments, :users
  end
end
