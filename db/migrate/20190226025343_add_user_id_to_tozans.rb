class AddUserIdToTozans < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM tozans';
    add_reference :tozans, :user, null: false, index: true
  end
  def down
    remove_reference :tozans, :user, index: true
  end
end
