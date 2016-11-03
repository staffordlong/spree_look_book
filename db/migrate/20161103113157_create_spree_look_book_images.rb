class CreateSpreeLookBookImages < ActiveRecord::Migration
  def change
    unless ActiveRecord::Base.connection.table_exists?('spree_look_books')
      create_table :spree_look_book_images do |t|
        t.string :alt_text
        t.references :look_book, index: true

        t.timestamps null: false
      end
    end
  end
end
