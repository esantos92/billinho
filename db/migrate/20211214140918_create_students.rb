class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.text :name
      t.text :cpf
      t.date :birthday_date
      t.text :celphone
      t.text :gender
      t.text :cep
      t.text :number
      t.text :adress
      t.text :district
      t.text :city
      t.text :state
      t.text :payment_mode

      t.timestamps
    end
  end
end
