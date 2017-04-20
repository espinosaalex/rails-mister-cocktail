class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :cocktails, :nqme, :name
  end
end
