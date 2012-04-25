class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, :null => false, :default => '', :limit => 128
      t.string :company, :null => true, :default => '', :limit => 128
      t.string :shops, :null => true, :default => '', :limit => 256
      t.text :ingriedients, :null => true, :default => ''
      t.references :user, :null => false
      t.decimal :price, :precision => 8, :scale => 2
      t.has_attached_file :photo

      t.timestamps
    end
    add_index :products, :user_id
    add_index :products, :name
    add_index :products, :company
    add_foreign_key :products, :users
  end
end
