class AddProfileFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :occupation, :string
    add_column :users, :skillset, :string
    add_column :users, :eyecolor, :string
    add_column :users, :DOB, :date
    add_column :users, :mobile_phone, :string
    add_column :users, :website, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
