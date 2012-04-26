class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.references :product
      t.text :body

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :product_id
    add_foreign_key :comments, :users
    add_foreign_key :comments, :products
  end
end
