class RenameNomToNameInUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :nom, :name
  end
end