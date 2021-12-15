class Fatura < ApplicationRecord
    belongs_to :matricula

    validates :valor_fatura, presence: true
    validates :data_vencimento, presence: true
    validates :matricula, presence: true
    validates :status, presence: true, inclusion: { in: %w(Aberta Atrasada Paga), 
        message: "%{value} não é um tipo válido, utilize Aberta, Atrasada ou Paga como opções."}
end
