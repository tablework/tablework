class AddLinkHtmlToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :link_html, :text
  end
end
