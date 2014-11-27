class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :answer
      t.references :questionable, polymorphic: true

      t.timestamps
    end
  end
end
