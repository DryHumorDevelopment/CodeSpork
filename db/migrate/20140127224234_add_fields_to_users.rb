class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_name, :string
    add_column :users, :avatar, :string
    add_column :users, :signature, :string
  end
end
