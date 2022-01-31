class Fatura < ApplicationRecord
    belongs_to :enrollment

    validates :bill_value, presence: true
    validates :due_date, presence: true
    validates :enrollment, presence: true
    validates :status, presence: true, inclusion: { in: %w(Aberta Atrasada Paga), 
        message: "%{value} não é um tipo válido, utilize Aberta, Atrasada ou Paga como opções."}
end
