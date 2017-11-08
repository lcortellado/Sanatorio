class AddNameToUsuarios < ActiveRecord::Migration[5.1]
  def change
    add_column :usuarios, :name, :string
    add_column :usuarios, :date_of_birth, :datetime
    add_column :usuarios, :is_female, :boolean, default: false
  end
end
