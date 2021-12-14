class CreateAlunos < ActiveRecord::Migration[6.1]
  def change
    create_table :alunos do |t|
      t.text :nome
      t.text :cpf
      t.date :data_nasc
      t.integer :celular
      t.text :genero
      t.text :forma_pagamento

      t.timestamps
    end
  end
end
