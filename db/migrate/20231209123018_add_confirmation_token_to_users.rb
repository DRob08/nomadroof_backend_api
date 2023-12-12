# db/migrate/[timestamp]_add_confirmation_token_to_users.rb
class AddConfirmationTokenToUsers < ActiveRecord::Migration[6.0]
    def change
      add_column :users, :confirmation_token, :string
      add_column :users, :confirmed_at, :datetime
    end
  end
  