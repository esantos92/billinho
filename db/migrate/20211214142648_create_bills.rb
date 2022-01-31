class CreateBills < ActiveRecord::Migration[6.1]
  def change
    create_table :bills do |t|
      t.decimal :bill_value
      t.date :due_date
      t.references :enrollment, null:false, foreign_key: true
      t.text :status, default: 'Aberta'

      t.timestamps
    end
  end
end
