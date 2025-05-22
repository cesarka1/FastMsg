class CreateAgendamentos < ActiveRecord::Migration[8.0]
  def change
    create_table :agendamentos do |t|
      t.datetime :data_hora
      t.text :observacoes
      t.references :pet, null: false, foreign_key: true
      t.references :veterinario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
