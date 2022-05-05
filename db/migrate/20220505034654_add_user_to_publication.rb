class AddUserToPublication < ActiveRecord::Migration[6.0]
  def change
    add_reference :publications, :user, null: false, foreign_key: true
  end
end
