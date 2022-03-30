class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.string :title
      t.string :description
      t.integer :salary
      t.boolean :taken
      t.string :business

      t.timestamps
    end
  end
end
