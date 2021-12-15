class Ie < ApplicationRecord
    has_many :matriculas

    validates :nome, presence: true, uniqueness: true
    validates :cnpj, presence: true, uniqueness: true, numericality: { only_integer: true }
    validates :tipo, inclusion: { in: %w(Universidade Escola Creche), 
        message: "%{value} não é um tipo válido, utilize Universidade, Escola ou Creche como opções."}   
end
