class Aluno < ApplicationRecord
    has_many :matriculas

    validates :nome, presence: true, uniqueness: true
    validates :cpf, presence: true, uniqueness: true, numericality: { only_integer: true }
    validates :genero, presence: true, inclusion: { in: %w(M F), 
        message: "%{value} não é um tipo válido, utilize M ou F como opções."}
    validates :forma_pagamento, presence: true, inclusion: { in: %w(Boleto Cartão), 
        message: "%{value} não é um tipo válido, utilize Boleto ou Cartão como opções."}
end
