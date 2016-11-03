class CreateSpreeLookBookImageProducts < ActiveRecord::Migration
  def change
    unless ActiveRecord::Base.connection.table_exists?('spree_look_book_image_products')
      create_table :spree_look_book_image_products do |t|
        t.belongs_to :look_book_image, index: true, foreign_key: true
        t.belongs_to :spree_product, index: true, foreign_key: true
        t.timestamps null: false
      end
    end
  end
end
