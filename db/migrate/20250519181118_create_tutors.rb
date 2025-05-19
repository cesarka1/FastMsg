class CreateTutors < ActiveRecord::Migration[8.0]
  def change
    create_table :tutors do |t|
      t.string :nome
      t.string :telefone
      t.string :email
      t.string :cpf
      t.string :rg

      t.timestamps
    end
  end
end
