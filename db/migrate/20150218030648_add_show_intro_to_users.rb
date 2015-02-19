class AddShowIntroToUsers < ActiveRecord::Migration
  def change
    add_column :users, :show_intro_1, :boolean, default: true
    add_column :users, :show_intro_2, :boolean, default: false
    add_column :users, :show_intro_3, :boolean, default: false
  end
end
