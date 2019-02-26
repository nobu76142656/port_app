class CreateTozans < ActiveRecord::Migration[5.2]
  def change
    create_table :tozans do |t|
      t.string :mountain
      t.string :elevation
      t.text :content
      t.date :date

      t.timestamps
    end
  end
end
