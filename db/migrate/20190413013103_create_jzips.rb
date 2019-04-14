class CreateJzips < ActiveRecord::Migration[5.2]
  def change
    create_table :jzips do |t|
      t.text :code
      t.text :pref
      t.text :city
      t.text :address

      t.timestamps
    end
  end
end
