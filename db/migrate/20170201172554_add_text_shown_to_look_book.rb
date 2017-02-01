class AddTextShownToLookBook < ActiveRecord::Migration
  def change
    add_column :look_books, :text_shown, :boolean, default: true
  end
end
