class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :lname
      t.string :fname
      t.string :email
      t.string :thumbnail

      t.timestamps null: false
    end
  end
end
