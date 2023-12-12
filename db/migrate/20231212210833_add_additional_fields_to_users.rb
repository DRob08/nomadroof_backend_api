class AddAdditionalFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :whatsapp_number, :string
    add_column :users, :languages_spoken, :string
    add_column :users, :about_me, :text
    add_column :users, :dob, :date
    add_column :users, :instagram_handle, :string
    add_column :users, :twitter_handle, :string
    add_column :users, :linkedin_handle, :string
  end
end
