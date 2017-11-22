class RemoveSexoMigrationFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :sexo, :boolean
  end
end
