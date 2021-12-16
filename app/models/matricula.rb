class Matricula < ApplicationRecord
    has_many :faturas
    belongs_to :aluno
    belongs_to :ie

    validates :valor_total, presence: true, numericality: { greater_than: 0 }
    validates :quantidade_faturas, presence: true, numericality: { greater_than_or_equal_to: 1 }
    validates :dia_vencimento, presence: true, numericality: { greater_than_or_equal_to: 1,
        less_than_or_equal_to: 30 } #mês comercial 30 dias;
    validates :nome_curso, presence: true
    validates :ie_id, presence: true
    validates :aluno_id, presence: true
end
