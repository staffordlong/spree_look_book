class CreateSpreeLookBooks < ActiveRecord::Migration
  def change
    unless ActiveRecord::Base.connection.table_exists?('spree_look_books')
      create_table :spree_look_books do |t|
        t.string :title
        t.string :slug
        t.boolean :active

        t.timestamps null: false
      end
    end
  end
end
