class AddImageIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Image_id, :string
  end
end
