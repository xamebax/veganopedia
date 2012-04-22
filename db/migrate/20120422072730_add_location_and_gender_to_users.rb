class AddLocationAndGenderToUsers < ActiveRecord::Migration
  def change
    add_column :users, :location, :string, :null => true, :length => 64
    add_column :users, :gender_id, :integer, :null => true, :default => nil
    add_index :users, :gender_id
    add_foreign_key :users, :genders
  end
end
