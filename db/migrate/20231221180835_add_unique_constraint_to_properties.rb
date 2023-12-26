class AddUniqueConstraintToProperties < ActiveRecord::Migration[6.0]
  def change
    add_index :properties, :name, unique: true
  end
end
