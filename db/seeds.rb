connection = ActiveRecord::Base.connection()
connection.execute("INSERT INTO genders (name) VALUES ('Female');")
connection.execute("INSERT INTO genders (name) VALUES ('Male');")
connection.execute("INSERT INTO genders (name) VALUES ('Other');")
