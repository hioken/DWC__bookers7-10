class AddColumnsToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :postal, :string
    add_column :books, :address, :string
  end
end
