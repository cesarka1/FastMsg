class CreatePets < ActiveRecord::Migration[8.0]
  def change
    create_table :pets do |t|
      t.string :nome
      t.string :especie
      t.references :tutor, null: false, foreign_key: true
      t.references :veterinario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
