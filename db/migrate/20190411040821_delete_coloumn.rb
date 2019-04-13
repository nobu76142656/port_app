class DeleteColoumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :places, :name
  end
end
