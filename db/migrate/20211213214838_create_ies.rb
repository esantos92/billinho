class CreateIes < ActiveRecord::Migration[6.1]
  def change
    create_table :ies do |t|
      t.text :Nome
      t.text :CNPJ
      t.text :Tipo

      t.timestamps
    end
  end
end
