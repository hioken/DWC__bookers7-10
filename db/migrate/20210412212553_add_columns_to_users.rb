class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :postal, :string
    add_column :users, :address, :string
  end
end
