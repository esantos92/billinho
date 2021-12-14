class CreateMatriculas < ActiveRecord::Migration[6.1]
  def change
    create_table :matriculas do |t|
      t.decimal :valor_total
      t.integer :quantidade_faturas
      t.integer :dia_vencimento
      t.text :nome_curso
      t.references :ies, null:false, foreign_key: true
      t.references :aluno, null:false, foreign_key: true

      t.timestamps
    end
  end
end
