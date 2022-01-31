class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.text :name
      t.text :cpf
      t.date :birthday_date
      t.text :celphone
      t.text :gender
      t.text :payment_mode

      t.timestamps
    end
  end
end
