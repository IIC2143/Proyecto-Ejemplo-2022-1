class RenameUsersToProfiles < ActiveRecord::Migration[6.1]
  def self.up
    rename_table :users, :profiles
  end

  def self.down
    rename_table :profiles, :users
  end
end
