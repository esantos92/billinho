class Matricula < ApplicationRecord
    has_many :bilss
    belongs_to :student
    belongs_to :institution

    validates :total_value, presence: true, numericality: { greater_than: 0 }
    validates :bills_amount, presence: true, numericality: { greater_than_or_equal_to: 1 }
    validates :due_day, presence: true, numericality: { greater_than_or_equal_to: 1,
        less_than_or_equal_to: 30 } #mês comercial 30 dias;
    validates :course_name, presence: true
    validates :institution_id, presence: true
    validates :student_id, presence: true

    after_create :create_bill

    private
    def create_bill
        CreateBill.perform(self)
        
    end    
end
