class CreateInstitutions < ActiveRecord::Migration[6.1]
  def change
    create_table :institutions do |t|
      t.text :name
      t.text :cnpj
      t.text :type

      t.timestamps
    end
  end
end
