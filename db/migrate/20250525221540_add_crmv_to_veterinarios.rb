class AddCrmvToVeterinarios < ActiveRecord::Migration[8.0]
  def change
    add_column :veterinarios, :crmv, :string
  end
end
