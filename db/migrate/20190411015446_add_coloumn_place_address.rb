class AddColoumnPlaceAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :address, :string
  end
end
