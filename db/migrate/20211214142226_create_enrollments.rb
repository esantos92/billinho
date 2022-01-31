class CreateEnrollments < ActiveRecord::Migration[6.1]
  def change
    create_table :enrollments do |t|
      t.decimal :total_value
      t.integer :bills_amount
      t.integer :due_day
      t.text :course_name
      t.references :institution, null:false, foreign_key: true
      t.references :student, null:false, foreign_key: true

      t.timestamps
    end
  end
end
