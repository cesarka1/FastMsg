class AddObservacoesAndDataNascimentoToPets < ActiveRecord::Migration[8.0]
  def change
    add_column :pets, :observacoes, :text
    add_column :pets, :data_nascimento, :date
  end
end
