class AddPdfLinkToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :pdf_link, :string
  end
end
