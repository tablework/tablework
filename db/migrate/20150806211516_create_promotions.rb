class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.string :code
      t.integer :duration

      t.timestamps null: false
    end
  end
end
