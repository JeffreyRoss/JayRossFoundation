class AddNameAndImageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :images, :string
  end
end
