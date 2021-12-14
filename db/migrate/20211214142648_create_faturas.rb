class CreateFaturas < ActiveRecord::Migration[6.1]
  def change
    create_table :faturas do |t|
      t.decimal :valor_fatura
      t.date :data_vencimento
      t.references :matricula, null:false, foreign_key: true
      t.text :status

      t.timestamps
    end
  end
end
