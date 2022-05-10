class AddUsersToOffer < ActiveRecord::Migration[6.0]
  def change
    change_table(:offers) do |t|
        t.references :offerer, foreign_key: { to_table: 'users' }
        t.references :aplicant, foreign_key: { to_table: 'users' }
    end
  end
end
