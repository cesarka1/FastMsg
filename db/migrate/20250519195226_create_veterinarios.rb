class CreateVeterinarios < ActiveRecord::Migration[8.0]
  def change
    create_table :veterinarios do |t|
      t.string :nome
      t.string :especialidade
      t.string :telefone

      t.timestamps
    end
  end
end
