class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :interests, :text
    add_column :users, :preferences, :text
  end
end
