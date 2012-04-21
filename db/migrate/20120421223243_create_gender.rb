class CreateGender < ActiveRecord::Migration
  def up
    ActiveRecord::Base.transaction do
      create_table :genders do |t|
        t.string :name, :null => false, :default => "", :limit => 32
      end
      add_index :genders, :id, :unique => true
      add_index :genders, :name, :unique => true
      execute("INSERT INTO genders (name) VALUES ('Female');")
      execute("INSERT INTO genders (name) VALUES ('Male');")
      execute("INSERT INTO genders (name) VALUES ('Other');")
    end
  end

  def down
    ActiveRecord::Base.transaction do
      remove_index :genders, :id
      remove_index :genders, :name
      drop_table :genders
    end
  end
end
