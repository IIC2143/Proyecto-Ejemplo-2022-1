class CreatePublications < ActiveRecord::Migration[6.1]
  def change
    create_table :publications do |t|
      t.string :title
      t.string :content
      t.string :photo

      t.timestamps
    end
  end
end
