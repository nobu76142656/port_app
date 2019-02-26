class ChangeTozansNameNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :tozans, :mountain, false
  end
end
