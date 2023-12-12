# db/migrate/xxxxxxxxxxxxxx_add_role_to_users.rb

class AddRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :integer, default: 0
  end
end
