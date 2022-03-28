class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :description
      t.string :email
      t.string :work
      t.integer :age
      t.string :photo

      t.timestamps
    end
  end
end
