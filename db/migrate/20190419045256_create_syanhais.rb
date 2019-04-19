class CreateSyanhais < ActiveRecord::Migration[5.2]
  def change
    create_table :syanhais do |t|
      t.string :name
      t.string :score
      
      t.timestamps
    end
  end
end
