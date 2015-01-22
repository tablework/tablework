class ChangeLinkFromNotes < ActiveRecord::Migration
  def change
  	change_column :notes, :link, :text
  end
end
