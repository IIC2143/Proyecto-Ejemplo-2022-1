class AddUserIdToOffer < ActiveRecord::Migration[6.0]
  def change
    change_table(:offers) do |t|
        t.references :user
    end
  end
end
